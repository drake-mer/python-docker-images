set -euxo

SOURCE="${1:-vanilla-pip}"
IMAGE="${SOURCE}:test"


echo "Running for source=${SOURCE}"
echo "Image will be built with tag ${IMAGE}"

function build_docker_image() {
  docker build -f Dockerfile.${SOURCE} . -t ${IMAGE}
}

function migrate() {
  if [[ ${SOURCE} == "vanilla-pip" ]]; then
    echo "vanilla pip, nothing to do"
    return
  else
    bash migrate_${SOURCE}.sh
  fi
}

function clean() {
  rm -v pyproject.toml poetry.lock Pipfile Pipfile.lock || true
  docker stop $(docker ps | grep "${IMAGE}" | cut -f 1 -d" ") || true
  docker rmi --force "${IMAGE}" || true
}

function start_image() {
  docker build . --file ./Dockerfile.${SOURCE} --tag ${SOURCE}:test
  docker run -p "5000:5000" -d ${SOURCE}:test
  echo "waiting for container to start"
  sleep 5 
}

function run_test() {
  result=$(curl -vv http://localhost:5000)
  if [[ ${result} != "Hello, World!" ]]; then
    echo "Failure! HTTP service returned \"${result}\", status code=$?"
  else
    echo "Success"
  fi
}

clean
migrate
build_docker_image
start_image
run_test
clean

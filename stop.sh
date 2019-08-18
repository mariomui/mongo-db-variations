source ./testIfContainerIsRunning.sh

docker stop $1
if (test $(testIfContainerIsRunning $1) == 0);
  then
    echo "$1 has stopped."
  else
    echo "Error occurred when attempting to stop $1"
fi
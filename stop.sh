source ./testIfContainerIsRunning.sh

docker stop SimplePayDB
if (test $(testIfContainerIsRunning SimplePayDB) == 0);
  then
    echo "SimplePayDB has stopped."
  else
    echo "Error occurred when attempting to stop SimplePayDB"
fi
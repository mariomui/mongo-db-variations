function testIfContainerIsRunning() {
  local res=0
  if ( test $(docker ps | awk '{print $NF}' | grep -w "$1" | wc -l) -gt 0 )
  then
    res=1
  fi
  echo $res
}

if (test $(baseName "$0") == "testIfContainerIsRunning.sh");
  then
    testIfContainerIsRunning "$@"
fi
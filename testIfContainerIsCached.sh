function testIfContainerIsCached() {
  local res=0
  if ( test $(docker ps -a | awk '{print $NF}' | grep -w "$1" | wc -l) == 1 );
    then
      res=1
  fi
  echo $res
}

if (test $(baseName "$0") == "testIfContainerIsCached.sh");
  then
    testIfContainerIsCached "$@"
fi
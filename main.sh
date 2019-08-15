# # if (test -f $(pwd)/if.sh && test $(validate) == true)
# # then
# #   echo oo
# # else
# #   echo boo
# # fi
# function valid() {
#   local res = true
#   if (doc)
# }
# function dockerExists() {
#   local res=false
#   if ( test $(docker ps -a | awk '{print $NF}' | grep -w testmongo | wc -l) -gt 0 )
#   then
#     res=true
#   fi
#   echo $res
# }

# echo $(dockerExists)

source ./testIfContainerIsCached.sh
source ./testIfContainerIsRunning.sh


function main () {
  
  isContainerRunning=$(testIfContainerIsRunning "$1")
  isContainerCached=$(testIfContainerIsCached "$1")
  containerStatus="$((2#$isContainerRunning$isContainerCached))"
  if (test $containerStatus == 2);
    then
      echo "Container is running and isn't cached-> impossible"
      echo false;
  elif (test $containerStatus == 1);
    then
      echo "$1 isn't running and is cached."
      docker start "$1"
      if (test $(testIfContainerIsRunning "$1") == 1);
        then
          echo "Container is now running."
          echo true
        else
          echo "Container unable to mend"
          echo false
      fi
  elif (test $containerStatus == 3);
    then
      echo "$1 is running and is cached. "
      echo true;
  else
    echo " $1's not running and it's not cached -> start the instance"
    docker run -d --name "$1" -p $2:27017 mongo
    if (test $(testIfContainerIsRunning "$1") == 1);
      then
        echo "Container is now running on port $2."
        sleep 2
        # docker exec -it $1 bash -c "mongo admin --eval db.createUser({user: 'admin', pwd: 'PASS', roles: [{role: 'userAdminAnyDatabase', db: 'admin'}]})"
        echo true
      else
        echo "Container unable to start"
        echo false
    fi
  fi
}

if (test $(baseName "$0") == "main.sh");
  then
    main "$@"
fi
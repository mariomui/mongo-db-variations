source ./main.sh

usage="$FUNCNAME [-h][-n containername][p] 
  -h show help 
  -n set container name 
  -p set container port"

n=""
p=""
while getopts ':hnp:' option; do
  case "$option" in
    h) echo "$usage"
      exit
      ;;
    n) n=$OPTARG
      echo $ne
      ;;
    p) p=$OPTARG
      ;;
    :) printf "missing argument for -%n or -%p\n" "$OPTARG" >&2
      echo "$usage" >&2
      exit 1
      ;;
    \?) printf "illegal option: -%n or %p\n" "$OPTARG" >&2
      echo "$usage" >&2
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

main SimplePayDB 29019
# sleep 5
# docker exec -it bash -c "mongo admin --host localhost -u USER_PREVIOUSLY_DEFINED \
# -p PASS_YOU_PREVIOUSLY_DEFINED --eval \
# "db.createUser({user: 'user', \
# pwd: 'PASS', roles: [{role: 'readWrite', db: 'simplePayDB'}]}); ;"

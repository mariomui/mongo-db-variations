


# usage="$(basename "$0") [-h] [-s n] -- program to calculate the answer to life, the universe and everything

# where:
#     -h  show this help text
#     -s  set the seed value (default: 42)"

# seed=42
# boo=0
# while getopts ':hsf:' option; do
#   case "$option" in
#     h) echo "$usage"
#        exit
#        ;;
#     s) seed=$OPTARG
#         echo $seed
#        ;;
#     f) boo=$OPTARG
#         echo $boo 
#        ;;
#     :) printf "missing argument for -%s\n" "$OPTARG" >&2
#        echo "$usage" >&2
#        exit 1
#        ;;
#    \?) printf "illegal option: -%s\n" "$OPTARG" >&2
#        echo "!!!$usage" >&2
#        exit 1
#        ;;
#   esac
# done
# shift $((OPTIND - 1))
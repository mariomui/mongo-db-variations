#removes storage removes the entire container as well.
docker rm -v -f $1
docker volume rm $1
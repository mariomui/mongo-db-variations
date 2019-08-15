# mongo-db-variations
different variations of a mongo build
requirements (docker);
# how to use
`npm start`

(running npm start will build it you the mongo instance) It should also tell you the port number)

`npm start` to spin it back up again.
`npm run stop` to stop the container.

## caveats
there isn't any persistent storage yet. It has a mounted volume but docker updates will kill it. And it's not the best practice way. 

## roadmap
[] need to choose a configuration technology (ansible, docker compose, k8)
[] need to choose a provisioner (Terraform, etc)
[] need to chooose a cloud provider (GCP, AWS...etc)
[] need to choose how to approch security.
[] need to reset the container, destory all data, and reset to new versions of this product.
[] need method to backup the volumes.

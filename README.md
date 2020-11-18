# vertica-cluster

### Step 1  
`docker compose up`

### Step 2
connect to vertica-node1.  

`docker exec -it vertica-node1 /bin/bash`

### Step 3 
run vertica cluster setup from vertica-node1.

`/opt/vertica/sbin/install_vertica --hosts vertica-node1,vertica-node2,vertica-node3 --rpm /tmp/vertica-9.2.1-8.x86_64.RHEL6.rpm --dba-user-password test@123 --failure-threshold HALT`

### Step 4 
switch to dbadmin and continue creating the database.
`su - dbadmin`

### Step 5 
use docker-compose with --no-recreate option
`docker-compose up --no-recreate`

### Sample Docker Commands

#### connect to container shell
`docker exec -it vertica-node1 /bin/bash`

#### build from docker file
`docker build -t vertica-node1 -f vertica-node1.dockerfile .`

#### run container
`docker run -d --name vertica-node1 vertica-node1`

`docker run -i -t --add-host vertica-node1:10.91.200.91 vertica-node1`

#### remove all containers
`docker container prune`

#### docker compose build
`docker-compose build`

#### docker compose run
`docker-compose run --use-aliases vertica-node1`

#### docker compose up
`docker-compose up`
`docker-compose up -d`
`docker-compose up --build`

#### attach to a container 
`docker attach vertica-node1`


#### docker remove dangling images 
FOR /f "tokens=*" %i IN ('docker images -q -f "dangling=true"') DO docker rmi %i

#### docker remove dangling containers
FOR /f "tokens=*" %i IN ('docker ps -a -q') DO docker rm %i
## Important points before you use this script 

<ol>
  <li>ensure docker is install and running </li>
  <li>make sure current user of your machine is allowed to use docker if you are not using root user </li>
  <li>you have to create two docker networks  </li>
</ol>

### allow non root user to use docker {if you are not using root user to run this script}

```
usermod -aG docker <username>
```

### creating docker network with exactly same subnet 

```
docker network create ansible_host1 --subnet 192.168.100.0/24 --gateway 192.168.100.1 
docker network create ansible_host1 --subnet 192.168.101.0/24 --gateway 192.168.101.1 

```

## Run that script using any of the method 

### method 1 
```
bash ansible_docker.sh 
```

### method 2

```
chmod +x ansible_docker.sh 
./ansible_docker.sh 
```

## if you are using method 2 then 

### to create ansible target host 

```
./ansible_docker.sh create 
```

### to stop all the ansible target host 

```
./ansible_docker.sh stop 
```

### to delete all the ansible target host 

```
./ansible_docker.sh destroy
```

### enjoy the Engineering !!...

# DNS 

### Deploy DNS custom domain based pods and service 

```
kubectl apply -f dns.yml 
service/default-subdomain created
pod/busybox1 created
pod/busybox2 created
fire@ashutoshhs-MacBook-Air ~ % kubectl get po
NAME       READY   STATUS    RESTARTS        AGE
busybox1   1/1     Running   0               2m17s
busybox2   1/1     Running   0               2m16s

===
kubectl get svc

default-subdomain   ClusterIP   None            <none>        1234/TCP   2m24s
```

### ping to pod by hostname  (local pod )

```
kubectl exec -it busybox1  -- sh 
/ # 
/ # cat  /etc/resolv.conf 
nameserver 10.96.0.10
search ashu-project.svc.cluster.local svc.cluster.local cluster.local ec2.internal
options ndots:5
/ # hostname
busybox-1
/ # ping busybox-1
PING busybox-1 (192.168.34.52): 56 data bytes
64 bytes from 192.168.34.52: seq=0 ttl=64 time=0.042 ms
64 bytes from 192.168.34.52: seq=1 ttl=64 time=0.048 ms
64 bytes from 192.168.34.52: seq=2 ttl=64 time=0.052 ms
```

### ping pod to pod by name 

```
ping busybox-2.default-subdomain.ashu-project.svc.cluster.local
PING busybox-2.default-subdomain.ashu-project.svc.cluster.local (192.168.50.211): 56 data bytes
64 bytes from 192.168.50.211: seq=0 ttl=62 time=0.475 ms
64 bytes from 192.168.50.211: seq=1 ttl=62 time=0.379 ms

```


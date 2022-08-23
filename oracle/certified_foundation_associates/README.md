### OCI platform Devision 

<img src="images/plat.png">

### Regions - availabilty zone 

<img src="images/region.png">

### fault domains - are logical DC within AV 

<img src="images/fault.png">

### fault domains have logical DC within the AV 

<img src="images/fl1.png">

# IAM 

### More info 

<img src="images/iam.png">

### how anybody can access OCI -- Identity domain - groups - users - RBAC - compartment - resources 

<img src="images/id.png">

### Every Resources in OCI is having Identity 

<img src="images/resource_id.png">

### example of Resources 

<img src="images/rsdemo.png">

## Compartment 

### root and other compartment 

<img src="images/cmp.png">

### resources can be moved from one compartment to others 

<img src="images/movecm.png">

### Resources from Multiple regions can be in same compartment 

<img src="images/cmm.png">

### Note: compartment can be nested at 6 level 

### compartments can have quotas and budget restrictions 

<img src="images/restrict.png">

## Tenancy -- is like a new account 

<img src="images/tenancy.png">

### some policies to OCI-admin 

<img src="images/pol.png">


# Networking in cloud 

## OCI -- VCN ---{Virtual Cloud Network}

### Introduction 

<img src="images/vcn.png">

### NAT gateway -- only for outbound traffic 

<img src="images/nat.png">

## gateways in VCN 

### NAT gateway
<p> Only for outbound connection for compute instances </p>
### Internat gateway 
<p> If OCI instances ingress and egress connection </p>
### service gateway

<p> If OCI Instances want to access OCI public services like OBject storage via secure connection </p>

<img src="images/gateway.png">

###  dynamic gateway routing 

<p> use to do routing on non-internet target either cloud of on primise systems </p>

<img src="images/dynamic.png">

## Routing table --

### for network packet flow control 

<img src="images/route.png">

### communication between two VCN 

<img src="images/vnc-comm.png">

## Security in VCN 

### security list  :- they are associated with SUbnets 

<img src="images/sec-list.png">


### network security groups :- ONly applies to Virtual NIC 

<img src="images/nsg.png">







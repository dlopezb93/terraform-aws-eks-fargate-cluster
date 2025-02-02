environment                  =  "prd"
cluster_name                 =  "main"
vpc_cidr                     =  "192.168.0.0/16"
vpc_name                     =  "main"
public_subnets_cidr          =  ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
private_subnets_cidr         =  ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]
availability_zones_public    =  ["us-east-1a", "us-east-1b", "us-east-1c"]
availability_zones_private   =  ["us-east-1d", "us-east-1b", "us-east-1f"]
cidr_block-internet_gw       =  "0.0.0.0/0"
cidr_block-nat_gw            =  "0.0.0.0/0"
eks_node_group_instance_types=  "t3.xlarge"
fargate_namespace            =  "fargate-node"
secret_id                    =  "database"
identifier                   =  "database"
allocated_storage            =  100
storage_type                 =  "io1"
engine                       =  "mysql"
engine_version               =  5.7
instance_class               =  "db.m5.xlarge"
database_name                =  "db"

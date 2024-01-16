provider "aws" {
  region = "us-east-1"
  profile = "default"
}

module "vpc" {
    source                              = "./vpc"
    environment                         =  var.environment
    vpc_cidr                            =  var.vpc_cidr
    vpc_name                            =  var.vpc_name
    cluster_name                        =  var.cluster_name
    public_subnets_cidr                 =  var.public_subnets_cidr
    availability_zones_public           =  var.availability_zones_public
    private_subnets_cidr                =  var.private_subnets_cidr
    availability_zones_private          =  var.availability_zones_private
    cidr_block-nat_gw                   =  var.cidr_block-nat_gw
    cidr_block-internet_gw              =  var.cidr_block-internet_gw
}


module "eks-stg" {
    source                              =  "./eks"
    cluster_name                        =  var.cluster_name
    environment                         =  var.environment_stg
    eks_node_group_instance_types       =  var.eks_node_group_instance_types
    private_subnets                     =  module.vpc.aws_subnets_private
    public_subnets                      =  module.vpc.aws_subnets_public
    fargate_namespace                   =  var.fargate_namespace
}

module "eks-prd" {
    source                              =  "./eks"
    cluster_name                        =  var.cluster_name
    environment                         =  var.environment_prd
    eks_node_group_instance_types       =  var.eks_node_group_instance_types
    private_subnets                     =  module.vpc.aws_subnets_private
    public_subnets                      =  module.vpc.aws_subnets_public
    fargate_namespace                   =  var.fargate_namespace
}


module "kubernetes-stg" {
    source                              =  "./kubernetes"
    cluster_id                          =  module.eks-stg.cluster_id    
    vpc_id                              =  module.vpc.vpc_id
    cluster_name                        =  module.eks-stg.cluster_name
    fargate_profile_arn                 =  module.eks-stg.fargate_profile_arn
    #depends_on = [ module.eks ]
}

module "kubernetes-prd" {
    source                              =  "./kubernetes"
    cluster_id                          =  module.eks-prd.cluster_id    
    vpc_id                              =  module.vpc.vpc_id
    cluster_name                        =  module.eks-prd.cluster_name
    fargate_profile_arn                 =  module.eks-prd.fargate_profile_arn
    #depends_on = [ module.eks ]
}
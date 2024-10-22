data "terraform_remote_state" "vault_cluster" {
  backend = "remote"
  config = {
    organization = "heinhtet-hca-org"
    workspaces = {
      name = "create-hcp-vault-cluster"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = { 
    organization = "heinhtet-hca-org"
    workspaces = {
      name = "create-vpc-subnet-rt-igw-ngw"
    }
  }
}

data "hcp_hvn" "hvn_cidr_block" {
  hvn_id = data.terraform_remote_state.vault_cluster.outputs.hvn_id
}


data "aws_vpc" "selected" {
  id = data.terraform_remote_state.vpc.outputs.vpc_id
}

data "aws_arn" "peer" {
  arn = data.aws_vpc.selected.arn
}
  
data "aws_route_table" "private_rt" {
  subnet_id = data.aws_subnets.private_subnets_ids.ids[0]
}

data "aws_subnets" "private_subnets_ids" {
  filter {
    name   = "vpc-id"
    values = [data.terraform_remote_state.vpc.outputs.vpc_id]
  }
    tags = {
    Name = "private*"
  }
}

data "aws_subnet" "private_subnet" {
  for_each = toset(data.aws_subnets.private_subnets_ids.ids)
  id       = each.value
}

data "aws_route_table" "db_rt" {
  subnet_id = data.aws_subnets.db_subnets_ids.ids[0]
}

data "aws_subnets" "db_subnets_ids" {
  filter {
    name   = "vpc-id"
    values = [data.terraform_remote_state.vpc.outputs.vpc_id]
  }
    tags = {
    Name = "db*"
  }
}

data "aws_subnet" "db_subnet" {
  for_each = toset(data.aws_subnets.db_subnets_ids.ids)
  id       = each.value
}





# data "terraform_remote_state" "remote_empower_master" {
#   backend = "s3"
#   config = {
#     bucket = "empower-master-tf-state"
#     key    = "env:/empower-master/tf-vpc-workspace.tfstate"
#     region         = "ap-southeast-1"
#     profile        = "empower-master"
#   }
# }
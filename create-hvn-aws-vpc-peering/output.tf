output "private_subnet" {
  value = data.aws_subnet.private_subnet[*]
}

output "private_subnet_ids" {
  value = data.aws_subnets.private_subnets_ids.ids
}
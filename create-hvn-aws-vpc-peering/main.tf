resource "hcp_aws_network_peering" "hvn_aws_peer_requester" {
  hvn_id          = data.terraform_remote_state.vault_cluster.outputs.hvn_id
  peering_id      = "hvn-vpc"
  peer_vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  peer_account_id = data.aws_vpc.selected.owner_id
  peer_vpc_region = data.aws_arn.peer.region
}

resource "aws_vpc_peering_connection_accepter" "aws_hvn_peer_accepter" {
  vpc_peering_connection_id = hcp_aws_network_peering.hvn_aws_peer_requester.provider_peering_id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}

resource "aws_route" "aws_private_route" {
  route_table_id            = data.aws_route_table.private_rt.route_table_id
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.aws_hvn_peer_accepter.id
  destination_cidr_block = data.hcp_hvn.hvn_cidr_block.cidr_block
}

resource "aws_route" "aws_db_route" {
  route_table_id            = data.aws_route_table.db_rt.route_table_id
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.aws_hvn_peer_accepter.id
  destination_cidr_block = data.hcp_hvn.hvn_cidr_block.cidr_block
}
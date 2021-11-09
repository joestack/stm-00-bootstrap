
output "tfc_token" {
  value = var.tfc_token
  sensitive = true
}

output "key1" {
  value = var.KEY1
}


output "vpc_id" {
  value = aws_vpc.hashicorp_vpc.id
}

output "dns_zone_id" {
  value = data.aws_route53_zone.selected.zone_id
}

output "dns_domain" {
  value = var.dns_domain
}

output "pri_key" {
  value = var.pri_key
  sensitive = true
}

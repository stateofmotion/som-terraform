module "vpc_network" {
  name       = var.name
  project_id = var.project_id
  source     = "../../common/vpc_network"
}

module "vpc_subnet" {
  ip_cidr_range = var.ip_cidr_range
  name          = var.subnet_name
  network_id    = module.vpc_network.id
  project_id    = var.project_id
  region        = var.region
  source        = "../../common/vpc_subnet"
}

output "network_id" {
  value = module.vpc_network.id
}

output "network_name" {
  value = module.vpc_network.name
}

output "subnet_id" {
  value = module.vpc_subnet.id
}

output "subnet_name" {
  value = module.vpc_subnet.name
}



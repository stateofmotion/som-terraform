# Summary
The som-terraform repository contains modules and documentation for module use which enables users to quickly scaffold infrastructure code.

# Components

## Organization Project Module
This module can be used to create a GCP project directly under an organization within GCP. Here you provide a billing account to use for the project. This can be found under the "Billing" section of your organization if you have IAM to view the billing. It's found under the "Billing account ID" column.

Example terraform file:
```
module "my_org_project" {
  source = "github.com/stateofmotion/som-terraform/modules/gcp/common/org_project"
  name = "My new example project"
  project_id = "example-project-1"
  org_id = "999999999999"
  billing_account = "111111-222222-555555"
}
```

## VPC Network Module
This module projects a basic network in GCP that will have a default name of network-1 if no name argument is provided.

Basic Example terraform file:
```
module "my_vpc_network" {
  name       = "my-network-1"
  project_id = "example-project-1"
  source     = "github.com/stateofmotion/som-terraform/modules/gcp/common/vpc_network"
}

locals {
  network_name = module.my_vpc_network.name
  network_id   = module.my_vpc_network.id
}
```

## VPC Subnet

Basic example terraform file:
```
module "my_vpc_subnet" {
  ip_cidr_range = var.ip_cidr_range
  name          = var.subnet_name
  network_id    = module.vpc_network.id
  project_id    = var.project_id
  region        = var.region
  source        = "github.com/stateofmotion/som-terraform/modules/gcp/common/vpc_subnet"
}

locals {
  subnet_name = module.my_vpc_subnet.name
  subnet_id   = module.my_vpc_subnet.id
}
```

## VPC Connector

Basic example usage:
```
module "my_vpc_connector" {
    source        = "github.com/stateofmotion/som-terraform/modules/gcp/common/vpc_connector
    network_name  = ""
    subnet_name   = ""
    project_id    = ""
    region        = ""
}

locals {
  connector_id = module.my_vpc_connector.connector_id
}
```

## Cloud Run
Basic example usage:
```
module "my_cloudrun_instance" {
    source        = "github.com/stateofmotion/som-terraform/modules/gcp/common/cloudrun
    region        = ""
}

locals {
  name = module.my_cloudrun_instance.name
  uri  = module.my_cloudrun_instance.uri
}
```

## API Service
Basic example usage:
```
module "my_api_service" {
  project_id    = ""
  source        = "github.com/stateofmotion/som-terraform/modules/gcp/common/services      = "run.googleapis.com"
}
```

## API Services
Basic exmaple usage:
```
module "my_api_services" {
  project_id    = ""
  source        = "github.com/stateofmotion/som-terraform/modules/gcp/common/services  = [
    "run.googleapis.com",
  ]
}
```

# Components

## Single Region VPC

Basic example terraform file:
```
module "my_single_region_network" {
  ip_cidr_range = ""
  project_id    = ""
  name          = ""
  subnet_name   = ""
  region        = ""
  source        = "github.com/stateofmotion/som-terraform/modules/gcp/components/single_region_vpc"
}

locals {
  network_id    = module.my_single_region_network.network_id
  network_name  = module.my_single_region_network.name
  subnet_id     = module.my_single_region_network.id
  subnet_name   = module.my_single_region_network.subnet_name
}
```
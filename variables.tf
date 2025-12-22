variable "name" { 
    type = string 
    }
variable "environment" { 
    type = string 
    }
variable "location" { 
    type = string 
    }
variable "rg_name" { 
    type = string 
    }
variable "cosmos_endpoint" { 
    type = string 
    default = " "
    }
variable "cosmosdb_name" {
    type = string
    default = " "
}
variable "cosmos_key" { 
    type = string 
    default = " "
    }
variable "cosmos_database" { 
    type = string 
    }
variable "cosmos_container" { 
    type = string 
    }

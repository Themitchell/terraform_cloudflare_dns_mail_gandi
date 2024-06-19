terraform {
  required_version = ">= 1.4"

  required_providers {
    local = "~> 2.0"

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0"
    }
  }
}

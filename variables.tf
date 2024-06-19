variable "zone_id" {
  description = "The zone id"
  type        = string
}

variable "dmarc_email" {
  description = "The email to send dmarc reports to"
  type        = string
  default     = null
}

variable "ttl" {
  description = "The TTL for DNS records"
  type        = number
  default     = 10800
}

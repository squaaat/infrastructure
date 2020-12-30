variable "meta" {
  type = object({
    team     = string
  })
}

variable "cidr_block" {
  type = string
  description = "vpc's maximum range for ipv4"
}
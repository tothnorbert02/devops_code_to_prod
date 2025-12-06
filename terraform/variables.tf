variable "project_name" {
  description = "Projekt rövid neve (pl. code2prod)"
  type        = string
}

variable "environment" {
  description = "Környezet: dev / staging / prod"
  type        = string
}

variable "location" {
  description = "Azure régió"
  type        = string
  default     = "westeurope"
}

variable "container_image" {
  description = "A konténer imagének elérési útja a registry-ben"
  type        = string
}

variable "container_port" {
  description = "Az alkalmazás által használt port a konténeren belül"
  type        = number
  default     = 8000
}
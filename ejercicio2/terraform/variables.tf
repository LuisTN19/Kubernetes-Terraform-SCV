variable "host_port" {
  description = "Puerto del host mapeado en kind (debe coincidir con kind-config.yaml)"
  type        = number
}

variable "mariadb_root_password" {
  description = "Contraseña de root para MariaDB"
  type        = string
  sensitive   = true
}

variable "mariadb_user" {
  description = "Usuario para la base de datos de Matomo"
  type        = string
}

variable "mariadb_password" {
  description = "Contraseña del usuario de Matomo"
  type        = string
  sensitive   = true
}

variable "mariadb_database" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "dockerhub_username" {
  description = "Docker Hub username for custom Matomo image"
  type        = string 
}

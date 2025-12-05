variable "host_port" {
  description = "Puerto NodePort del servicio. Debe coincidir con el 'containerPort' definido en el mapeo de puertos de Kind"
  type        = number
}

variable "mariadb_root_password" {
  description = "Contraseña de root para MariaDB"
  type        = string
  sensitive   = true
}

variable "mariadb_user" {
  description = "Usuario de la base de datos"
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

variable "dockerhub_image" {
  description = "Referencia completa de la imagen en Docker Hub, incluyendo el formato 'usuario/nombre-imagen:tag'."
  type        = string 
}

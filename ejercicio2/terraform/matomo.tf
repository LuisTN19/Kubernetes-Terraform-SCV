resource "kubernetes_deployment" "matomo" {
  metadata {
    name = "matomo"
    labels = { app = "matomo" }
  }

  spec {
    replicas = 1
    selector {
      match_labels = { app = "matomo" }
    }
    template {
      metadata {
        labels = { app = "matomo" }
      }
      spec {
        container {
          name  = "matomo"
          image = var.dockerhub_username
          
          port {
            container_port = 80
          }

          
          env {
            name  = "MATOMO_DATABASE_HOST"
            value = "service-mariadb"
          }
          env {
            name  = "MATOMO_DATABASE_USERNAME"
            value = var.mariadb_user
          }
          env {
            name  = "MATOMO_DATABASE_PASSWORD"
            value = var.mariadb_password
          }
          env {
            name  = "MATOMO_DATABASE_DBNAME"
            value = var.mariadb_database
          }
          
          volume_mount {
            name       = "matomo-storage"
            mount_path = "/var/www/html"
          }
        }
        volume {
          name = "matomo-storage"
          persistent_volume_claim {
            claim_name = "matomo-pvc"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "matomo_service" {
  metadata {
    name = "service-matomo"
  }
  spec {
    selector = { app = "matomo" }
    type = "NodePort"
    port {
      port        = 80
      target_port = 80
      node_port   = var.host_port
    }
  }
}
resource "google_cloud_run_v2_service" "app" {
  name     = var.cloud_run_service_name
  location = var.region

  template {
    containers {
      image = var.container_image

      env {
        name  = "DB_HOST"
        value = google_sql_database_instance.postgres.ip_address[0].ip_address
      }

      env {
        name  = "DB_NAME"
        value = var.db_name
      }

      env {
        name  = "DB_USER"
        value = var.db_user
      }

      env {
        name  = "DB_PASSWORD"
        value = var.db_password
      }

      ports {
        container_port = 8080
      }
    }
  }

  depends_on = [
    google_sql_database_instance.postgres
  ]
}
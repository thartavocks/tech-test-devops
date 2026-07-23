resource "google_sql_database_instance" "postgres" {
  name             = "postgres-instance"
  region           = var.region
  database_version = "POSTGRES_16"

  settings {
    tier = "db-custom-1-3840"

    ip_configuration {
      ipv4_enabled = true
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "app_db" {
  name     = var.db_name
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "app_user" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}

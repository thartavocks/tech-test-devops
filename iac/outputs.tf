output "vpc_name" {
  value = google_compute_network.main.name
}

output "public_subnet" {
  value = google_compute_subnetwork.public.name
}

output "private_subnet" {
  value = google_compute_subnetwork.private.name
}

output "cloudsql_instance" {
  value = google_sql_database_instance.postgres.name
}

output "cloudsql_connection_name" {
  value = google_sql_database_instance.postgres.connection_name
}

output "cloud_run_url" {
  value = google_cloud_run_v2_service.app.uri
}
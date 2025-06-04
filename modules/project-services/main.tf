resource "google_project_service" "required_services" {
  for_each = toset(var.enabled_apis)

  service            = each.value
  disable_on_destroy = false
}

output "enabled_services" {
  value = [for svc in google_project_service.required_services : svc.service]
}

provider "google" {
  version = "3.13.0"
  // The default region to manage resources in. If another region is specified on a regional resource, it will take precedence.
  // Alternatively, this can be specified using the GOOGLE_REGION environment variable or any of the following ordered by precedence.
  region = var.region
  // The default zone to manage resources in. Generally, this zone should be within the default region you specified.
  // If another zone is specified on a zonal resource, it will take precedence.
  // Alternatively, this can be specified using the GOOGLE_ZONE environment variable or any of the following ordered by precedence.
  zone = var.zone

  //The ID of the project in which the resource belongs. If it is not provided, the provider project is used.
  project = var.project_id
}

# Need to use Beta provider for private_cluster feature
##########################################################
provider "google-beta" {
  version = "3.13.0"
  // The default region to manage resources in. If another region is specified on a regional resource, it will take precedence.
  // Alternatively, this can be specified using the GOOGLE_REGION environment variable or any of the following ordered by precedence.
  region = var.region
  // The default zone to manage resources in. Generally, this zone should be within the default region you specified.
  // If another zone is specified on a zonal resource, it will take precedence.
  // Alternatively, this can be specified using the GOOGLE_ZONE environment variable or any of the following ordered by precedence.
  zone = var.zone
}
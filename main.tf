   provider "google" {
     credentials = file(var.credentials_file)
     project     = var.project_id
     region      = var.region
   }

   resource "google_container_cluster" "primary" {
     name               = "gke-cluster"
     location           = var.region
     initial_node_count = 1

     node_config {
       machine_type = "n1-standard-1"
     }
   }

   resource "google_container_node_pool" "primary_nodes" {
     cluster    = google_container_cluster.primary.name
     location   = google_container_cluster.primary.location
     name       = "primary-node-pool"

     node_count = 1

     node_config {
       machine_type = "n1-standard-1"
       oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
     }
   }

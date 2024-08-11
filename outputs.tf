   output "gke_cluster_name" {
     value = google_container_cluster.primary.name
   }

   output "gke_cluster_endpoint" {
     value = google_container_cluster.primary.endpoint
   }

   output "gke_cluster_node_pools" {
     value = google_container_node_pool.primary_nodes.name
   }

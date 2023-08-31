
aws_eks_cluster_config = {

      "demo-cluster1" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-00d272e61d1f2006b","subnet-020330c3a87f6c3a3"]
        tags = {
             "Name" =  "demo-cluster1"
         }  
      }
}

eks_node_group_config = {
  "node1" = {
        eks_cluster_name         = "demo-cluster1"
        node_group_name          = "myeksnode"
        nodes_iam_role           = "eks-node-group-general"
        node_subnet_ids          = ["subnet-00d272e61d1f2006b","subnet-020330c3a87f6c3a3"]

        tags = {
             "Name" =  "node1"
         } 
  }
}
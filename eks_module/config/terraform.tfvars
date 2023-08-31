
aws_eks_cluster_config = {

      "demo-cluster1" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-00487708e9558e49b","subnet-0fb007f04b73fa0b5"]
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
        node_subnet_ids          = ["subnet-00487708e9558e49b","subnet-0fb007f04b73fa0b5"]

        tags = {
             "Name" =  "node1"
         } 
  }
}
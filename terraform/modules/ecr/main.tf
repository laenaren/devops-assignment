resource "aws_ecr_repository" "mytomorrows_repo" {
    name                 = "mytomorrows-repo" 

    image_scanning_configuration {
        scan_on_push = true
    }

    tags = {
        Environment = "Development"
        Team        = "DevOps"
    }
}
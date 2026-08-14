# Terraform AWS Production Infrastructure
A production-style Infrastructure as code (Iac) project was build with Terraform on AWS .
This repository demonstrates how modern cloud infrastructure can be provisioned, managed and automated using Terraform, GitHub Actions and AWS services while following Devops best pratices.
---
# Project overview
This project provisions a highly available web application infrastructure on AWS using Terraform
The infrastructure includes networking,compute, security,load balancing, Dns, SSL/TLS and remote state management. Throught the project I continously refactored the architecture to improve maintainability and seprate infrastructure provisioning form apllication deployment.
The project started as a smiple Terraform Ec2 deployment and gradually evolved into a prodcution- style infrastructure using reusable modules and CI automation.
---
# Architecture
,,,
Internet
    |
Route53
    |
ACM certificate
    |
Application Load Balancer
    |
Target Group
    |
Auto Scaling Group
    |
EC2 Instances
    |
custom VPC
|-- Public Subnets
|-- private Subnets
|-- Internet Gateway
|-- Route Tables
``
---
 # AWS Services Used
- Amazon VPC
- Public subnets 
- private subnets
- Internet Gatewat
- Route Tables
- Security Groups
- EC2
- Launch Templates
- Auto Scaling Groups
- Applicaiton Load Blancer
- Target Groups 
- Route53
- AWS Certificate Manager (ACM)
- IAM Roles
- S3 Remote Backend
- DaynamoDB State Locking
---
# Technologies
- Terraform 
- AWs
- Git
- GitHub
- GitHub Actions
- linux
- Bash
---
# Features
- Infrastructure as code using Terraform
- Modular Terraform architecture
- Custom VPC
- Auto Scaling 
- Apllication Load Blancer
- HTTPS using ACM
- Coustom Domain Using Route53
- Remote Terraform State
- State Locking
- GitHub Actions Continuous Integration
- Infrastructure validation pipeline
---
# Repository Structure
,,,
 
 Terraform-project-asg/
 |
 |--- backend.tf
 |--- provider.tf
 |--- variable.tf
 |--- outputs.tf
 |--- main.tf
 |
 |--- modules/
 |  |---alb/
 |  |---asg/
 |  |---EC2/
 |  |---iam/
 |  |---route53/
 |  |---security-group/
 |  |---VPC/
 | 
 |--- scripts/
 |  |--- userdata.sh
 |  |--- deploy.sh
 |
 |--- website/
 |  |--- index.html
 |
 |--- docs/
 |
 |--- README.md
 ,,,
 
 ---
 # CI Pipeline
 Every Push to GitHub Automatically Performs:
 - Terraform Format Check 
 - Terraform Intialization
 - Terraform Validation
 - Terraform Planning
 
This ensures infrastructure changes are validated before deployment.
---
# Design Evolution
## Initial Design
The project initially embedded the complete website directly inside the Terraform 'user-data' block.
Although suitable for learning Terraform, this tightly coupled infrastructure provisioning with application content.
Every wevsite modification required a Terraform deployment.
---
# Refactoring
As the website became larger, the deployment process was redesigned.
The bootstrap process was separated into:
### userdate.sh
Responsable for:
- Installing requried packages
- Congiguring the EC2 instance
- Preparing The Operating System
### deploy.sh
Responsable for:
- Deploying the website
- Updating application independently of Terraform
This sepration keeps Terraform focused on infrastructure while deployment is handled seprately.
---
# Current Deployment
Currently `deploy.sh` retrieves the latest website from GitHub.
This approach simplifies development but is recognised as an intermidiate solution rather than a production deployment strategy.
---
###
Planned Improvement
The next stage of the project is to integrate AWS System Manager (SSM) Run Command.
The Objective is:
GitHub Actions
  |
AWS System Manager
  |
Run deploy.sh
  |
Update Website
without requring SSH access or manually loging into EC2 instances.
This will further separate infrastructure provisioning from application deployment.
---
# Engineering Decisions
Serval architectural decisions were made through out the project to improve maintainability.
# Remote state
Terraform state is stored remotely in Amazon S3 with DynamoDB state locking to support collaborative infrastructure management.
### Modular Design
Infrastructure is divided into resuable Terraform modules rather than keeping all resources inside a single cofiguration file.
### Auto Scaling Group
The application is deployed behind an Auto Scaling Group to improve availability and resilience.
### Load Blancer
Application traffic is distrubuted through an Application Load Blancer allowing multiple EC2 instances to serve requests.
### HTTPS
AWS certificate Manager provides SSL/TLS certificates while Route53 manages DNS records for custom domain.
### Continuous Integration
GitHub Actions automatically validates infrastructure changes before deployment.
---
# Skills Demonstrated
- Terraform 
- Infrastructure as code 
- AWS Networking
- EC2 
- VPC Design
- Security Group
- Route53
- ACM (Amazon certificate manager)
- IAM
- Auto Scaling Group
- Load Blancing
- GitHub Actions
- Linux
- Bash Scripting
- Remote State Management

---
# Future Improvements
- AWS System Manager Deployment
- GitHub Actions Continous Deployment 
- OIDC Authentication
- Blue/Green Deployments
- Multi-Environment Infrastructure 
- Monitoring with CloudWatch
- Infrastructure Testing
- Containersed Application Deployment
---

# Screenshots 
The following screenshots can be added to document project:
- AWS Architecture 
- VPC
- Auto Scaling Group
- Application Load Blancer 
- Route53
- ACM Certificate
- GitHub Actions Pipeline
- Website
- Terraform plan 
- terraform apply
---
# Lesson learned 
This project reinforced several important Devops principles:
- Infrastructure should be version controlled.
- Infrastructure provisioning should be seprated from applicaiton deployment.
- Automation improves consistency and reliablity.
- Incremental refactoring leads to better long-term maintainability.
- Designing reusable infrasturcture simplifies future expansion.
---
# Author

KUMAR

GitHub:(https://github.com/pranay9528)
Portfolio: https://kumarstack.com
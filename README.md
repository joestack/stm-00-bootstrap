# stm-00-bootstrap

The aim of this repo is to setup IaC pipelines that belong to the scope of a project.
A project is usually built upon different services that are connected together in a specific manner. 
Each service has its own life-cycle that is usually managed by a dedicated group of people that are identified based on their identity (RBAC). 

A project might be based on a "foundation" service that is responsible for providing network and security to one or several other "application" services. Each service is maintained by dedicated roles to achieve segregation of duties that is aligned with the specifics of your organizational requirements (i.e. Dev, Sev, Ops, XYZ roles).

A IaC pipeline represents a dedicated data-driven process for each of those services. It consists of a VCS repository that is connected to a dedicated workspace within Terraform [Enterprise|Cloud]. 
People with proper access to that repository are enabled to perform CI (Continuous Integration) tasks while the CD (Continuous Delivery or Deployment) part is handled by the corresponding Terraform workspace. 

In other words: The bootstrap segregates the processual ownership to teams by assigning scoped IaC pipelines to them. Each team has full processual ownership of their pipeline. They are responsible for codifying the IaC (data) that generates the required state of a workload. Workspace settings and optional policies affect the CD part to guarantee that the outcome is aligned with governance and compliance.  
  
The bootstrap is the so-called secret zero. It bootstraps the necessary infrastructure for an agile project. It is usually an IT Service Management task to bootstrap a project. This can also be automated by an API driven workflow towards the Terraform [Enterprise|Cloud] API. Initial secrets and sensitive values can be provided securely via API. 


Bootstrap: Admin--->TFE-API--->Bootstrap-Module-+-Variables-->Workspace-0--->{

IaC-Pipeline-1: Team-1--->VCS-Repo-1---->Workspace-1---->Workload-1

IaC-Pipeline-2: Team-2--->VCS-Repo-2---->Workspace-2---->Workload-2

....

}

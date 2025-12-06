# devops_code_to_prod
DevOps Code to Production házi feladat (Python + Docker + Terraform + GitHub Actions)
Code to Production
Ez a projekt bemutatja, hogyan lehet egy egyszerű Python alkalmazást
konténerizálni, infrastruktúraként leírni, majd CI/CD pipeline-nal kezelni.
A feladat fő részei:

1. Alkalmazás + Docker
Az app/ mappában található egy egyszerű Python alkalmazás (FastAPI).
A projekt tartalmaz:
•	Dockerfile – az alkalmazás konténerizálása
•	.dockerignore
•	requirements.txt
A Docker image helyben így építhető:
docker build -t devops_code_to_prod .

2. Infrastruktúra mint kód (Terraform)
Az infrastruktúra a terraform/ mappában található.
Struktúra:
terraform/
  main.tf
  providers.tf
  variables.tf
  outputs.tf
  env/dev.tfvars
  env/staging.tfvars
  env/prod.tfvars
A három környezet (dev / staging / prod) külön .tfvars fájlokkal konfigurálható.
A validáció:
terraform init -backend=false
terraform validate

3. CI Pipeline (GitHub Actions)
Workflow: .github/workflows/docker-ci.yml
Funkciói:
•	Docker image build
•	Image push a GitHub Container Registry-be (GHCR)
•	Automatikusan fut, ha a main branchre push történik
•	Manuálisan is indítható (dev / staging / prod taggel)
Az elkészült image-ek itt találhatók: https://github.com/tothnorbert02?tab=packages

4. CD Pipeline (Terraform Validate)
Workflow: .github/workflows/terraform-deploy.yml
Feladata:
•	Terraform inicializálás
•	Terraform konfiguráció validálása
Ez demonstrálja az IaC alapú deploy folyamatot.

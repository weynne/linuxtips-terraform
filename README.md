# LINUXtips-Terraform-2024.2

### Terraform - Comandos Básicos

1. Criar um arquivo `main.tf` na raiz do seu projeto com o seguinte conteúdo:

```
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
```
###### Dados obtido em: [Terraform Registry: Resource:aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

2. Executar o comando `terraform init -upgrade` para inicializar um diretório de trabalho do Terraform. O comando `-upgrade` server para sempre que inicializar procurar a versão mais atual do plugin. 

3. Defina as variáveis de ambiente com o suas chaves de acesso pública e privada da AWS:
```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
```
###### Dados obtido em: [Terraform Registry: AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

4. Criar um arquivo `provider.tf` na raiz do seu projeto com o seguinte conteúdo: 
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "sa-east-1"
}
```
###### Dados obtido em: [Terraform Registry: AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

5. Executar o comando `terraform plan -out NOME_DO_PLAN` para criar o plano a ser aplicado. O camando `-out`serve para salvar o plano e definir um nome para ele. 

6. Executar o comando `terraform apply "NOME_DO_PLAN"`para aplicar o plano.  

7. Executar o comando `terraform destroy`para destruir o que foi aplicado com o plano. 

8. É possível criar um plano para destruir, utilizando o comando: `terraform plan -destroy -out NOME_DO_PLAN`. Depois é só executar o comando `terraform apply "NOME_DO_PLAN"`. 

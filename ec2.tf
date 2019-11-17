terraform {
  backend "s3" {
    bucket         = "terraform-jhd282"
    key            = "eu-west-1/kafka"
    region         = "eu-west-1"
    dynamodb_table = "locks"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.18"
  skip_credentials_validation = true
}

resource "aws_instance" "kafka1" {
  ami                         = "ami-04c58523038d79132"
  instance_type               = "t2.medium"
  key_name                    = "asaushkin"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-07c4666eb1d450f1e"]

  tags = {
    Name            = "kafka1"
    zookeeper       = true
    kafka_broker    = true
    schema_registry = true
    kafka_connect   = true
    kafka_rest      = true
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}

resource "aws_instance" "kafka2" {
  ami                         = "ami-04c58523038d79132"
  instance_type               = "t2.medium"
  key_name                    = "asaushkin"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-07c4666eb1d450f1e"]

  tags = {
    Name         = "kafka2"
    zookeeper    = true
    kafka_broker = true
    ksql         = true
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}

resource "aws_instance" "kafka3" {
  ami                         = "ami-04c58523038d79132"
  instance_type               = "t2.medium"
  key_name                    = "asaushkin"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-07c4666eb1d450f1e"]

  tags = {
    Name         = "kafka3"
    zookeeper    = true
    kafka_broker = true
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}

resource "aws_instance" "control-center" {
  ami                         = "ami-04c58523038d79132"
  instance_type               = "t2.medium"
  key_name                    = "asaushkin"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-07c4666eb1d450f1e"]

  tags = {
    Name = "control-center"
    control_center = true
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}

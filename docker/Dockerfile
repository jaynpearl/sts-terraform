FROM ubuntu:16.04

RUN echo PS1=\"\\u@terraform:\\W$ \" >> ~/.bashrc

RUN apt-get update && \
    apt-get install -y \ 
       python3 \
       python3-pip \
       git \
       vim \
       wget \
       unzip
RUN pip3 install awscli

ARG TERRAFORM_PATH=https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip

RUN wget -q -O terraform.zip "$TERRAFORM_PATH" && unzip terraform.zip -d /usr/local/bin && rm terraform.zip

RUN mkdir -p /seek

WORKDIR /seek

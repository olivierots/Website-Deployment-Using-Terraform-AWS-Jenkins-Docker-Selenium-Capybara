FROM alpine

MAINTAINER Olivier Otshudi <olivierots@hotmail.com>

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /

RUN apk add --no-cache ca-certificates 

USER nobody

ENTRYPOINT [ "/terraform" ]

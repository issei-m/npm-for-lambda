FROM amazonlinux:2017.03.1.20170812

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash -

RUN yum update -y && yum install -y \
    nodejs \
    gcc-c++ \
    make

WORKDIR /root

ENTRYPOINT ["npm"]

FROM registry.access.redhat.com/ubi9-beta/ubi
LABEL org.opencontainers.image.authors="scott.mccarty@gmail.com"
RUN yum install -y iputils

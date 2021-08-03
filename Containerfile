FROM registry.access.redhat.com/ubi8/ubi
LABEL org.opencontainers.image.authors="scott.mccarty@gmail.com"
RUN yum install -y iputils

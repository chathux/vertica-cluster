FROM centos:7.4.1708
LABEL maintainer="udaya.chathuranga@thealtria.com"

RUN yum install -y \
    sudo \
    which \
    openssh-server \
    openssh-clients \
    openssl \
    iproute \
    dialog \
    gdb \
    gdb-gdbserver \
    sysstat \
    mcelog \
    bc \
    ntp \
    gcc-c++ \
    cmake \
    python-setuptools

# Root SSH configuration
USER root
RUN mkdir ~/.ssh && cd ~/.ssh && ssh-keygen -t rsa -q -f id_rsa \
    && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
    && /usr/bin/ssh-keygen -A

#copy vertica installer
COPY local_media/vertica-9.2.1-8.x86_64.RHEL6.rpm /tmp/vertica-9.2.1-8.x86_64.RHEL6.rpm
RUN rpm -Uvh /tmp/vertica-9.2.1-8.x86_64.RHEL6.rpm

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh
CMD ["/opt/entrypoint.sh"]


FROM ubuntu:16.04

ENV ANSIBLE_BRANCH stable-2.2

ENV PATH /usr/local/ansible/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PYTHONPATH /usr/local/ansible/lib:
ENV MANPATH /usr/local/ansible/docs/man

RUN apt update && \
    apt install -y --no-install-recommends \
        python \
        python-pip \
        python-dev \
        python-setuptools \
        build-essential \
        dos2unix \
        libffi-dev \
        libssl-dev \
        mysql-client \
        libmysqlclient-dev \
        dos2unix \
        rsync \
        openssh-client \
        git \
        unzip \
        curl \
        jq && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --upgrade pip && \
    pip install python-consul boto mysql paramiko PyYAML Jinja2 httplib2 six azure==2.0.0rc5 awscli && \
    rm -Rf ~/.pip/cache/ /tmp/* /var/tmp/*

ADD ./ansible-env.sh /
RUN git clone git://github.com/ansible/ansible.git --recursive /usr/local/ansible && \
    /ansible-env.sh

ENV TERRAFORM_VERSION 0.8.5

RUN curl "https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip" -o /tmp/terraform.zip && \
    unzip /tmp/terraform.zip && mv terraform /usr/local/bin/ && \
    rm -f /tmp/terraform.zip

RUN groupadd jenkins -g 1001 && useradd -u 1001 -g 1001 -m jenkins

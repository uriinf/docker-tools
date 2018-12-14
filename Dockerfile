FROM python:3.7.1-slim

ENV ANSIBLE_BRANCH stable-2.7

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
    pip install python-consul boto boto3 botocore paramiko PyYAML Jinja2 httplib2 six awscli cfn_flip && \
    rm -Rf ~/.pip/cache/ /tmp/* /var/tmp/*

ADD ./ansible-env.sh /
RUN git clone git://github.com/ansible/ansible.git --recursive /usr/local/ansible && \
    /ansible-env.sh

ENV TERRAFORM_VERSION 0.11.10

RUN curl "https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip" -o /tmp/terraform.zip && \
    unzip /tmp/terraform.zip && mv terraform /usr/bin/ && \
    rm -f /tmp/terraform.zip

RUN groupadd -g 1000 runner && \
    useradd -u 1000 -g 1000 -m runner
USER runner

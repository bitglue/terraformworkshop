FROM golang

RUN mkdir -p /go/src/github.com/hashicorp &&\
    cd /go/src/github.com/hashicorp &&\
    git clone https://github.com/bitglue/terraform.git terraform &&\
    cd terraform &&\
    git checkout ff93c4376dd4f16683db7664e971e059bb6e11ac &&\
    make updatedeps &&\
    make dev &&\
    rm -rf /go/src

RUN apt-get -q update && apt-get install -y python-pip vim

RUN pip install awscli

RUN cd /usr/src &&\
    git clone https://github.com/paperg/awsudo.git &&\
    cd awsudo &&\
    python setup.py install

WORKDIR /root
CMD ["/bin/bash"]

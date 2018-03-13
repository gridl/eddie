FROM alpine:3.6

# System setup
ENV USER app
RUN addgroup -g 1000 app && adduser -D -G app -u 1000 app
ENV dir /home/app
ENV LC_ALL=en_US.utf-8

# System dependencies
RUN apk add --no-cache python3 python3-dev
RUN python3 -m ensurepip
RUN pip3 install --upgrade pip setuptools
RUN apk add --no-cache openssl-dev \
  gcc \
  musl-dev \
  git

WORKDIR ${dir}

# Update pip
RUN pip3 install --upgrade pip setuptools

# App dependencies
RUN pip3 install celery[redis]==4.1.0 \
  flower==0.9.2

# File upload
COPY tasks.py ${dir}/tasks.py
RUN chown -R ${USER}: ${dir}

# App setup
USER ${USER}

# Flower port
EXPOSE 5555

CMD true

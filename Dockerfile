FROM ubuntu:14.04.4
ENV GIT_DIR=/data
ENV GIT_BRANCH=master
RUN apt-get update \
  && apt-get install -y python-pip python-dev build-essential git \
  && rm -rf /var/lib/apt/lists/* \
  && pip install gitpython==0.3.2.RC1 boto==2.8.0 python-dateutil==1.5 pytz==2012h python-cloudfiles==1.7.11 \
  pip install git-bigstore

# Configure .ssh directory
RUN mkdir /root/.ssh \
    && chmod 0600 /root/.ssh \
    && echo StrictHostKeyChecking no > /root/.ssh/config

# Configure entrypoint
COPY /docker-entrypoint.sh /
COPY /docker-entrypoint.d/* /docker-entrypoint.d/
RUN chmod 755 /docker-entrypoint.sh && chmod -R 755 /docker-entrypoint.d

ENTRYPOINT ["/docker-entrypoint.sh"]

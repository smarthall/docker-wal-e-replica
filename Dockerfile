FROM library/centos:centos6

# Image settings
MAINTAINER Daniel Hall <daniel@danielhall.me>
CMD ['/opt/app/bin/boot']
EXPOSE 5432

# Install dependencies
RUN rpm -ivh \
      http://yum.postgresql.org/9.3/redhat/rhel-6.6-x86_64/pgdg-centos93-9.3-1.noarch.rpm \
      http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm \
 && yum -y install \
      postgresql93 \
      postgresql93-libs \
      postgresql93-devel \
      postgresql93-server \
      postgresql93-contrib \
      python-psycopg2 \
      pv \
      gcc \
      lzop \
      python-pip \
      python-devel \
      postgresql-devel \
 && yum clean all

# Install WAL-E
RUN pip install wal-e

# Install core app files
ADD app /opt/app


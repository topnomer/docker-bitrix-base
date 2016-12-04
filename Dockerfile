FROM centos:centos6
MAINTAINER Dmitry S <smalllark@gmail.com>
ADD bitrix-env.sh /root/bitrix-env.sh
RUN /bin/bash /root/bitrix-env.sh && \
    yum -y install python-setuptools php-ldap && \
    easy_install supervisor && \
    mv /home/bitrix/www /home/bitrix/default && \
    rm /root/.bash_profile && \
    usermod -u 1000 bitrix && groupmod -g 1000 bitrix
ADD run.sh /run.sh

CMD ["/run.sh"]

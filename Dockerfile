FROM centos:centos6
MAINTAINER Dmitriy S <smalllark@gmail.com>
ADD bitrix-env.sh /root/bitrix-env.sh
RUN chmod 755 /root/bitrix-env.sh && \
    echo "5" | /root/bitrix-env.sh && \
    yum -y install python-setuptools && \
    easy_install supervisor && \
    mv /home/bitrix/www /home/bitrix/default && \
    rm /root/.bash_profile && \
    usermod -u 1000 bitrix && groupmod -g 1000 bitrix
ADD run.sh /run.sh

CMD ["/run.sh"]

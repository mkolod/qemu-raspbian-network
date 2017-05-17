FROM ubuntu:xenial

ENV ETCDCTL_VERSION v3.0.12
ENV ETCDCTL_ARCH linux-amd64

RUN apt-get -y update
RUN apt-get -y upgrade

# Install QEMU/KVM
RUN apt-get -y install qemu-kvm qemu-system-arm wget unzip net-tools

RUN mkdir /root/rpi_boot

COPY kernel-qemu-4.4.34-jessie /root/rpi_boot

COPY 2017-01-11-raspbian-jessie.img /root/rpi_boot

COPY qemu-pi.sh /root/rpi_boot

WORKDIR /root/rpi_boot

#RUN wget https://archive.org/download/20170111RaspbianJessie/2017-01-11-raspbian-jessie.zip

#RUN unzip 2017-01-11-raspbian-jessie.zip && chmod 777 2017-01-11-raspbian-jessie.img

#RUN apt-get -y install apt-utils fakechroot

#RUN mkdir tmp 

#RUN apt-get -y install fakeroot

#RUN apt-get -y install debootstrap

#RUN mount -o rw,offset=70254592 2017-01-11-raspbian-jessie.img ./tmp

#RUN fakechroot fakeroot debootstrap --variant=fakechroot mount -o rw,offset=70254592 2017-01-11-raspbian-jessie.img ./tmp

#RUN echo -e "# $(cat /mnt/tmp/etc/ld.so.preload)" > ./tmp/etc/ld.so.preload

#RUN fakechroot umount ./tmp

#RUN rm 2017-01-11-raspbian-jessie.zip

RUN apt-get install bridge-utils

#RUN brctl addbr br0

#RUN brctl showbr br0

CMD ./qemu-pi.sh 2017-01-11-raspbian-jessie.img

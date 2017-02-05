FROM densuke/ubuntu-jp-remix:trusty

MAINTAINER hiroaki0404@gmail.com

ENV DEBIAN_FRONTEND noninteractive
#RUN apt-get update -y
RUN apt-get install -y wget && \
     wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add - && \
     wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add - && \
     wget -q https://www.ubuntulinux.jp/sources.list.d/vivid.list -O /etc/apt/sources.list.d/ubuntu-ja.list
RUN apt-get update -y && \
     apt-get upgrade -y && \
     apt-get install -y openssh-server xterm xauth x11-xserver-utils imagemagick libgconf-2-4 libnss3 \
     unzip mozc-server uim uim-mozc fonts-takao git python3-numpy python3-matplotlib
RUN locale-gen en_US.UTF.8
WORKDIR /usr/local/share
RUN git clone https://github.com/oreilly-japan/deep-learning-from-scratch
WORKDIR /opt
RUN wget -O /tmp/VSCode-linux64.zip -q https://az764295.vo.msecnd.net/public/0.10.3/VSCode-linux64.zip && unzip /tmp/VSCode-linux64.zip && rm /tmp/VSCode-linux64.zip && ln -s /opt/VSCode-linux-x64/Code /usr/local/bin/code
ADD run.sh /etc/
RUN chmod +x /etc/run.sh
EXPOSE 22
CMD /etc/run.sh

FROM ubuntu:latest

RUN apt-get update && apt-get install -y openssh-server python-pip \
      && rm -rf /var/lib/apt/lists/*

# Install python package
RUN pip install --upgrade pip==9.0.3 && pip install netaddr deepdiff

RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN mkdir -p /root/.ssh/
COPY ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 0700 /root/.ssh
RUN chmod 0644 /root/.ssh/authorized_keys
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

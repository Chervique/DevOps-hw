FROM slave
RUN apt update 
RUN    apt install openssh-server -y
RUN    apt install nano -y
RUN    apt install software-properties-common -y 
RUN    apt-add-repository ppa:ansible/ansible  
RUN    apt install -y gnupg software-properties-common curl  
RUN    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -  
RUN    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"  
RUN    apt update  
RUN    apt install awscli -y  
 
RUN    apt install terraform -y  
RUN    apt install ansible -y
RUN    apt install git -y   
RUN    apt install ssh -y
RUN    systemctl enable ssh
RUN    service ssh start

RUN    ansible-galaxy collection install amazon.aws

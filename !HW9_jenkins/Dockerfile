FROM slave
RUN apt update 
RUN    apt install openssh-server -y
RUN    apt install nano -y
RUN    apt install software-properties-common -y 
RUN    apt-add-repository ppa:ansible/ansible  
RUN    apt install -y gnupg software-properties-common curl  
RUN    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -  
RUN    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"  
RUN    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
RUN    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN    apt update  
RUN    apt install awscli -y  
RUN    apt install openjdk-8-jdk -y
RUN    apt install terraform -y  
RUN    apt install ansible -y
RUN    apt install git -y   
RUN    apt install docker -y
RUN    apt install jenkins -y

   

RUN    ansible-galaxy collection install amazon.aws
RUN    apt install python3-boto3 -y
RUN    apt-get -y install python3-distutils
RUN    wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
RUN    python3 /tmp/get-pip.py

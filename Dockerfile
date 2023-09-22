FROM kalilinux/kali-rolling

# Update and Upgrade
RUN apt-get update && apt-get dist-upgrade -y

# Install Kali Linux Full
#RUN apt-get install kali-linux-headless -y

# Setup SSH
RUN apt-get install openssh-server sudo git wget zsh -y

# Setup user
RUN echo "root:root" | chpasswd

# Run SSH Server
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 222/' /etc/ssh/sshd_config # Modify Port 222 to port you want.
EXPOSE 222

# Setup oh-my-zsh
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/install.sh
RUN bash /tmp/install.sh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

RUN sed -i 's/plugins=(git)/plugins=(\ngit\nzsh-autosuggestions\nzsh-syntax-highlighting\n)/g' /root/.zshrc
RUN chsh -s /bin/zsh root
RUN touch /root/.hushlogin

CMD ["/usr/sbin/sshd", "-D"]

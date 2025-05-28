FROM ubuntu:16.04

# Install vulnerable packages
RUN apt-get update && apt-get install -y --no-install-recommends openssh-server

# Configure SSH (vulnerable default settings)
RUN sed -i 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Open ports for SSH
EXPOSE 22

# Run SSH server in the foreground
CMD ["/usr/sbin/sshd", "-D"]

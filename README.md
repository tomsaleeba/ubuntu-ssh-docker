A simple docker container that starts a openssh server. You deploy the image to
a k8s cluster and then you can ssh into the container to debug network
connectivity issues.

# Quickstart
1. build the image
    ```bash
    docker build .
    ```
1. push and deploy the image somewhere
1. check the logs for the container when it starts and it'll show you the
   private key to use to connect and an example of the ssh command
    ```
    ...
    + ln -s /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
    + echo '==== The private key ===='
    ==== The private key ====
    + cat /root/.ssh/id_rsa
    -----BEGIN OPENSSH PRIVATE KEY-----
    b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
    ...(snip)...
    c+yN8kEROhZqcAAAARcm9vdEAzOWFiZjQyOTM5MDgBAg==
    -----END OPENSSH PRIVATE KEY-----
    + service ssh start
     * Starting OpenBSD Secure Shell server sshd                      [ OK ] 
    + echo 'ready for connection, use:'
    ready for connection, use:
    + echo '  ssh -i <key from above> root@<ip> -p 80'
      ssh -i <key from above> root@<ip> -p 80
    + sleep 99d
    ```

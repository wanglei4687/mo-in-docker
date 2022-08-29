FROM docker:22.06.0-beta.0-dind

#RUN echo -e http://mirrors.ustc.edu.cn/alpine/v3.16/main/ > /etc/apk/repositories
#RUN apk update && apk add --no-cache curl bash

# Install kubectl
#RUN  curl -sSL -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.24.4/bin/linux/amd64/kubectl \
#    && chmod +x /usr/local/bin/kubectl
COPY kubectl /usr/local/bin/
RUN chmod +x /usr/local/bin/kubectl

# Install KIND
#RUN curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.14.0/kind-linux-amd64 \
#    && chmod +x ./kind \
#    && mv ./kind /usr/local/bin/kind
COPY kind /usr/local/bin/
RUN chmod +x /usr/local/bin/kind

# Install Helm
#RUN wget https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz && tar -zxvf helm-v3.9.4-linux-amd64.tar.gz
#RUN mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64 helm-v3.9.4-linux-amd64.tar.gz
COPY helm /usr/local/bin/
RUN chmod +x /usr/local/bin/helm

RUN helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts

COPY start.sh /

RUN chmod 755  /start.sh

VOLUME /var/lib/docker
EXPOSE 2375 2376

ENTRYPOINT ["dockerd-entrypoint.sh"]
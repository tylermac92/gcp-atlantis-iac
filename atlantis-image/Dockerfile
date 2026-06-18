FROM ghcr.io/runatlantis/atlantis:latest
USER root
RUN apk add --no-cache bash curl
RUN curl -fsSL https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
RUN curl -fsSL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin
RUN tflint --version && trivy --version
USER atlantis

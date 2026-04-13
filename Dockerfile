FROM ubuntu:22.04

RUN apt update && apt install -y curl ca-certificates

# install enowxai
RUN curl -sSL https://enowxlabs.com/install.sh | bash

ENV PATH="/root/.local/bin:$PATH"

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

FROM ubuntu:22.04

RUN apt update && apt install -y \
  curl \
  ca-certificates \
  nodejs \
  npm

# install enowxai
RUN curl -sSL https://enowxlabs.com/install.sh | bash

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app
COPY . .

RUN npm install

CMD ["node", "server.js"]

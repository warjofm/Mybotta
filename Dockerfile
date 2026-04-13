FROM ubuntu:22.04

RUN apt update && apt install -y \
  curl \
  ca-certificates \
  bash \
  unzip \
  tar \
  xz-utils

# 🔥 install enowxai (yang bener)
RUN curl -sSL https://api.enowxlabs.com/install/enowx-ai?mode=binary | bash

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app
COPY . .

CMD ["node", "server.js"]

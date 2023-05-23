FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  git \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Menghapus workdir sebelumnya
RUN rm -rf /app

WORKDIR /app

RUN git clone https://github.com/AyGemuy/Hinata.git .

# Mematikan npm sebelumnya dan menginstall ulang paket
RUN pkill npm || true
RUN rm -rf node_modules
RUN rm -f package-lock.json
COPY package*.json ./
RUN npm install

EXPOSE 5000

CMD ["npm", "start"]

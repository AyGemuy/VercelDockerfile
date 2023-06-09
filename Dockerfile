FROM nikolaik/python-nodejs:latest
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y --no-install-recommends \
  git \
  neofetch \
  ffmpeg \
  wget \
  sudo \
  tesseract-ocr \
  chromium \
  imagemagick
RUN pip install pillow
RUN npm install -g npm@latest
RUN npm install -g forever@latest
WORKDIR /app
RUN git clone https://github.com/AyGemuy/HinataV2.git .
RUN npm install
CMD ["npm", "start"]

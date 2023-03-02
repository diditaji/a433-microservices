# Dockerfile ini akan menggunakan image dari Node.js version 14
FROM node:14-alpine
# Menggunakan /app sebagai working directory
WORKDIR /app
# Melakukan copy seluruh isi dari direktori didalam file ini ke dalam container
COPY . .
# Menetukan environtment yang digunakan
ENV NODE_ENV=production DB_HOST=item-db
# Memasang depedensi dan build apps
RUN npm install --production --unsafe-perm && npm run build
# Melakukan expose port
EXPOSE 8080
# Menjalankan npm ketika container start
CMD ["npm", "start"]
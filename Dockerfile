FROM node:20

WORKDIR /app

COPY  ./package.json ./package.json
COPY  ./package-lock.json ./package-lock.json

RUN npm install
COPY . .

ENV DATABASE_URL='postgresql://neondb_owner:npg_vQg1EN6uVobj@ep-frosty-rain-adf9ao7r-pooler.c-2.us-east-1.aws.neon.tech/neondb?sslmode=require&channel_binding=require'
RUN DATABASE_URL=${DATABASE_URL} npx prisma migrate dev
RUN npx prisma generate
RUN npm run  build
EXPOSE 3000

CMD [ "npm", "start" ]
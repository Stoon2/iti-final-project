FROM node:12
COPY nodeapp /nodeapp
WORKDIR /nodeapp
RUN npm install
ENV HOST=localhost
ENV USERNAME=user
ENV PASSWORD=password
ENV DATABASE=database
CMD ["node", "/nodeapp/app.js"]
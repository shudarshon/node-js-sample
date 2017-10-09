# node-js-sample

A barebones Node.js app using [Express 4](http://expressjs.com/).

## Running Locally

Make sure you have [Node.js](http://nodejs.org/).

```sh
git clone git@github.com:heroku/node-js-sample.git # or clone your own fork
cd node-js-sample
npm install
npm start
```

## Dockerizing App

Make sure you have docker installed. I am running docker with sudo privileges.

```sh
sudo docker build -t node_app .
sudo docker run -p 5000:5000 -d node_app
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

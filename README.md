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

## Travis CI

Install travis client and configure secrets.

```sh
sudo gem install travis
cd /path/to/repository
travis encrypt DEPLOY_HOST=X.X.X.X --add
travis encrypt DEPLOY_PATH=/home/user/app --add
travis encrypt DEPLOY_USER=user --add
```

Now in same directory implement the following command to generate SSH public-private keypair to perform remote deployment.

```sh
ssh-keygen -t rsa -b 4096 -C 'build@travis-ci.org' -N '' -f ./deploy_rsa
travis encrypt-file deploy_rsa --add
mv deploy_rsa.enc .travis/
```

Now add that public key in remote server's `authorized_keys` file for SSH approval. (For EC2 instance, better you bake AMI with packer and predefined SSH key )

```sh
cat ./deploy_rsa.pub | ssh -i ~/.key/test.pem DEPLOY_USER@DEPLOY_HOST "cat - >> ~/.ssh/authorized_keys"
rm -f deploy_rsa deploy_rsa.pub
git add deploy_rsa.enc .travis.yml
```

Now, Travis will automatically build app on git push.

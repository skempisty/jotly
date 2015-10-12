# Jotly
Version 1.0

### Synopsis

Jotly is a simple image based bulletin board/blogging application.

### Author

* Stephen Kempisty

### Install

Make sure you have Ruby 2.2.0, Bundler, and the Heroku Toolbelt installed.

#### Running Locally

'''
  git clone skempisty@github.com:heroku/jotly.git
  bundle
  cd jotly
  bundle exec rake bootstrap
  heroku local
'''

Jotly should now be running on localhost:3000.

#### Deploying to Heroku

'''
  heroku create
  git push heroku master
  heroku run rake db:migrate
  heroku open
'''

AWS configuration variables must be set to support image handling

'''
  heroku config:set S3_BUCKET_NAME=your_bucket_name
  heroku config:set AWS_ACCESS_KEY_ID=your_access_key_id
  heroku config:Set AWS_SECRET_ACCESS_KEY=your_secret_access_key
'''

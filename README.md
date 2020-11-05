# Askme

The application is made for educational purposes, reminds [ask.fm](https://ask.fm).
Users can ask each other questions and answer them.
Implemented the functionality of creating a hashtag for questions.
Added recaptcha to prevent bots from being used.
Configured to work with [Heroku](heroku.com), demo here [mymegaquestion.herokuapp.com](mymegaquestion.herokuapp.com)


## Requirements

ruby '2.7.0'

rails '~> 6.0.3', '>= 6.0.3.1'

A complete list of gems used is specified in the Gemfile

## Getting started

Download or clone repo

Use bundler (skip gems needed only in production)
```
bundle install --without production
```

Run database migrations
```
bundle exec rails db:migrate
```

Launch Rails server 
```
bundle exec rails s
```

Open `http://localhost:3000` in your browser

# Billboard

## Overview

Billboard allows for community creation of slides. The intent is that students at the [Turing School of Software & Design](https://www.turing.io/) will be able to visit [the live app](http://turing-billboard-api.herokuapp.com/), add a slide, and see it displayed on a monitor on campus (with a browser [pointed to the `/billboard` route](http://turing-billboard-api.herokuapp.com/billboard)). Students login with their GitHub user account.

## Setup

In order to get this appication up and running in your dev environment, you will need to [register a new application with GitHub](https://github.com/settings/applications/new), and set  `github_client_id`, and `github_client_secret` in your environment variables (I use [Figaro](https://github.com/laserlemon/figaro))

You'll also need to `rake db:create db:migrate`.

## Test Suite

The test suite is written in RSpec and will run from the terminal by simply entering `rspec`.

## Deploying

It is possible to use this application for your own purposes with minor changes.

1. Replace the Turing logo image in `app/assets/images` with the image that you would like as a background image.
2. Change the name of the image in line 4 of the `app/assets/stylesheets/billboard.css.erb` to match the new image that you have saved.
3. You may also want to update the `background-color` in line 8 to suit your image and the background-color in line 42 to match your organization's color scheme.

After that you should be set to deploy. More information on how to deploy to Heroku available [here](https://devcenter.heroku.com/articles/getting-started-with-rails5#deploy-your-application-to-heroku), and for instructions on how to deploy to Digital Ocean check [here](https://www.digitalocean.com/community/tutorials/how-to-use-the-ruby-on-rails-one-click-application-on-digitalocean).

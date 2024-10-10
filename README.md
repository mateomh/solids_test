# README

This is a project to learn how to integrate Solid Queue and Solid Cache into an application. The solids are going to be the standard in Rails 8 so it is a good opportunity to get used to them

## Spin up the application
This application is built with docker, so it is very easy to get it running, you only have to run the following command

```bash
docker compose up
```

To connect to the app container to run the rails as if it was in your computer just run
```bash
docker exec -it solids_test-api-1 bash
```
That command will drop you inside the bash console of the api container and then you can do whatever you want and also spin up the console by running the `rails console` command.

## Mission Control
To go to the dashboard  just go to [this link](http://localhost:3929/jobs)

## Solid Cache 1.0.x problems
The documentation for Solid Cache 1.0.x is not matching what the configuration of the application needed so a lot of problems with the databases presented that is why version 0.7.0 was selected.

## Mission Control alternate configuration
On october 5th 2024 a new version of Mission Control was released that works out of the box with API only applications, before that it was setup to work with fullstack Rails applications so to make it work with API only some changes had to be made

The application controller inheritance had to be changed to action controller base instead of action controller api. This is a big change and it was recommended to create a ApiController that kept the original inheritance and make all the controllers inherit from that and leave the application controller inheriting from base and don't use it for anything else

```ruby
class ApplicationController < ActionController::Base>
```

Other thing that had to be added in addition to the mission_control-jobs gem was the `sprockets-rails` gem, this one helps with some libraries that were missing in the API only app

And the last configuration was to create a `manifest.js` file for the assets in the folder `./app/assets/config` just with a `{}` inside it. That helps with the startup.

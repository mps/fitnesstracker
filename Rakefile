#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Fitnesstracker::Application.load_tasks

desc "Deploy the site"
task :deploy => [:push_github, :push_heroku]

task :push_github do
  `git push origin master`
end

task :push_heroku do
  `git push heroku master`
end

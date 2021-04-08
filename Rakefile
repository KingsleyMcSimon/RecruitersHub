# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'yaml'

require_relative "config/application"

Rails.application.load_tasks

YAML.safe_load(File.read('config/database.yml'), aliases: true) 

#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

HoresaseBody::Application.load_tasks

require 'pathname'
require 'active_record'
require './app/models/horesase.rb'

task :default => :build

BASE_DIR = Pathname('.')
BODY_DIR = BASE_DIR + 'body'

task :environment do
  ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'db/development.sqlite3',
    :timeout => 5000
  )
end

desc "Build #{BODY_DIR}/*.txt"
task :build => :environment do
  horesases = Horesase.all
  horesases.each do |horesase|
    body_path = BODY_DIR + "#{horesase.id}.txt"
    File.open(body_path, 'w') do |f|
      f.write(horesase.body + "\n")
    end
  end
end

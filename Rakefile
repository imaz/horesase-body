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
end

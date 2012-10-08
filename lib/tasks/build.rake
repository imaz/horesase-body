BODY_DIR = Rails.root + 'body'

task :default => :build

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

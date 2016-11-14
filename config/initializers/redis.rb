puts '####', ENV["REDISTOGO_URL"], '$$$$$$'
uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:url => uri)

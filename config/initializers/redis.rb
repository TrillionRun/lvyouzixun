puts '####', ENV["REDISTOGO_URL"], '$$$$$$'
uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/" )
REDIS = Redis.new(:url => uri)

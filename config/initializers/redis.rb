puts '####', ENV["REDIS_URL"], '$$$$$$'
uri = URI.parse(ENV["REDIS_URL"] || "redis://localhost:6379/" )
REDIS = Redis.new(:url => uri)

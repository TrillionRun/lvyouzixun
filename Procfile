web: bin/rails server -p $PORT -e $RAILS_ENV
resque: env TERM_CHILD=1 bundle exec rake environment resque:work QUEUE=video

  # keep alive server
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new

scheduler.every '10m' do
  require "net/http"
  require "uri"
  url = 'http://migasmailer.herokuapp.com/keepalive'
  Net::HTTP.get_response(URI.parse(URI.encode(url)))
end

# set pony mail
# Pony.options = {
#   :from => 'noreply@dephub.go.id',
#   :via => :smtp,
#   :via_options => {
#     :address => 'bigpotatoes2.qwords.net',
#     :port => 465,
#     :domain => 'rifanmfauzi.com',
#     :user_name      => 'kemenhub@rifanmfauzi.com',
#     :password       => 'initalkshow',
#     :authentication => 'login',
#     :ssl                  => true,
#     :openssl_verify_mode  => 'none' #Use this because ssl is activated but we have no certificate installed. So clients need to confirm to use the untrusted url.
#   }
# }

# Pony.options = {
#   :from => 'noreply@dephub.go.id',
#   :via => :smtp,
#   :via_options => {
#     :address => 'smtp.sendgrid.net',
#     :port => 587,
#     :domain => 'heroku.com',
#     :user_name      => 'app31558314@heroku.com',
#     :password       => 'rg68qktn',
#     :authentication => 'plain',
#     :enable_starttls_auto => true
#   }
# }

Pony.options = {
  :from => 'noreply@migas.esdm.go.id',
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'gmail.com',
    :user_name            => 'analisismigas@gmail.com',
    :password             => 'testing1234',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
}
require 'sinatra'
require 'haml'
require 'sass'

require 'twilio-ruby'
require 'pry'
require 'dotenv'
Dotenv.load


configure do
  set :scss, {:style => :compressed, :debug_info => false}
  set :bind, '0.0.0.0'
end

get '/css/:name.css' do |name|
  content_type :css
  scss "sass/#{name}".to_sym, :layout => false
end

get '/' do
end

get '/sms' do
 haml :sms
end

post '/sms' do
  
  account_sid = 'AC89f1950f579fb841a657fed01990da20' 
  auth_token = ENV['TWILIO_AUTH_TOKEN'] 

  binding.pry
  @client = Twilio::REST::Client.new account_sid, auth_token 
  
  @client.account.messages.create({
    from: '+17077352034',    
    to: params[:destination],
    body: params[:message]
  })

  
end

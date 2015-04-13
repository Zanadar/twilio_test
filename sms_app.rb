require 'sinatra'
require 'twilio-ruby'

set :bind, '0.0.0.0'
account_sid = 'AC89f1950f579fb841a657fed01990da20' 
auth_token = ENV['TwilioAuthToken'] 

get '/sms' do
 erb :sms
end

post '/sms' do
  @client = Twilio::REST::Client.new account_sid, auth_token 
  
  @client.account.messages.create({
    :from => '+17077352034',    
  })
end

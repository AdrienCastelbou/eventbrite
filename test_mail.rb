require 'mailjet'
Mailjet.configure do |config|
  config.api_key = ENV['MJ_APIKEY_PUBLIC']
  config.secret_key = ENV['MJ_APIKEY_PRIVATE']  
  config.api_version = "v2.9"
end
variable = Mailjet::Send.create(messages: [{
    'From'=> {
        'Email'=> '$SENDER_EMAIL',
        'Name'=> 'Me'
    },
    'To'=> [
        {
            'Email'=> '$RECIPIENT_EMAIL',
            'Name'=> 'You'
        }
    ],
    'Subject'=> 'My first Mailjet Email!',
    'TextPart'=> 'Greetings from Mailjet!',
    'HTMLPart'=> '<h3>Dear passenger 1, welcome to <a href=\'https://www.mailjet.com/\'>Mailjet</a>!</h3><br />May the delivery force be with you!'
}]
)
p variable.attributes[:messages]
# Airbnb clone



### Create a simple Rails Project with Bootstrap  
1. install bootstrap gem

### Create basic authentication
1. install devise gem '4.2'

### Building navbar with partial view  
1. copy navbar static from bootstrap demo
2. create partial shared/navbar
3. add devise paths to navbar

### Authentication with full name
1. generate migration AddFullnameToUser fullname:string
2. add validations
3. add permisions for fullname in devise in application controller

### Update authentication views
1. add bootstrap to devise forms  
2. add name instead of email to shared/navbar  

### Gravatar
1. Update root path
2. Add avatar_url helper with css class for diffrent size

### Notification
1. Add toastr-rails gem
2. Add js and css for toastr
3. Add toastr for flash messages
4. Add toastr for devise messages to views

### Sending transactional email with Gmail
1. Add gem figaro and configure -> info from comments
2. Add smtp configuration to development.rb
3. Change devise configuration
4. Add confirmable to user.rb
5. Add migration for confirmable
6. Problems wiht gmail solution in [Stak Overflow](https://stackoverflow.com/questions/25209676/running-into-smtp-error-when-trying-to-send-email-in-ror-app)  

### Sending transactional email with Mailgun
1. Create mailgun account
2. Comment out gmail settings
3. Add credentials to config/application.yml
4. Change email adres to valid one in devise.rb (config.mailer_sender = 'anandomar2@wp.pl')
5. Update rails configuration for host (config.action_mailer.default_url_options = { host: 'https://airbnb-code4startup-kajzer.c9users.io' })
6. Update development.rb to use ENV varaibles through figaro

### Create Facebook app

### Create social authentication
1. Add gem omniauth and omniauth-facebook
2. Generate migration AddFieldsToUser provider:string uid:string image:string
3. Add config.omniauth :facebook, 'API_KEY', 'API_SECRET', scope: 'email', info_fields: 'email, name' to devise.rb
4. Change 'API_KEY' and 'API_SECRET' to ENV['fb_app_id'] and ENV['fb_app_secret']
5. Add method self.from_omniauth(auth) to User
6. Add controller omniauth_callbacks_controller.rb and paste contents from [devise/omniauth](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)
7. Add button to views/devise/sessions/new.html.erb and registrations/new
8. Moddify routes.rb 
9. Modify helper method to display avatar from fb as well
10. Solution to uninitialized Users [Stack Overflow](https://stackoverflow.com/questions/13537313/routing-error-uninitialized-constant-users?rq=1)

### Stying views
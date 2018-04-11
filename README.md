# Airbnb clone



### Create a simple Rails Project with Bootstrap  
1. install bootstrap gem

### Create basic authentication
1. install devise gem

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
1. Add styles and google fonts

### Create user profile page
1. Generate migration - add phone_number and description to User
2. Add route for users :show
3. Create file users_controller.rb
4. Add styling for user show view

### Create edit profile page
1. Add styles and additional fields to profile page
2. Remove current password_field from registrations/edit
3. Create RegistrationsController

### Create Room Model
1. Rails g model Room with many fields
2. Add association to models

### Create Room Controller
1. Rails g controller Rooms with many actions
2. Fill out Rooms controller actions
3. Update routes.rb

### Create Room Views
1. Create rooms/new view
2. Create sidebar
3. Create rooms/photo_upload view -> without uploads yet
4. Create rooms/listing view placeholder
5. Create rooms/amenities view placeholder
6. Create rooms/description view placeholder
7. Create rooms/location view placeholder
8. Create rooms/pricing view placeholder
9. Create partial for sidebar (link helpers are without @room and they are member routes)

### Styling Views
1. Add styling to aplication.scss for form elements 
2. Change class name for _room_menu.html.erb partial GIT - 6d154051623b2511b89f5203d6366b53c4b0433f
3. Correct few style mistakes GIT - 04b46eef06d068e5cd8694e6788b89fb6ebe7df4

### Understanding the workflow
1. Add some fronted validation to views GIT - 489ce42

### Install paperclip
1. Install ImageMagick "sudo apt-get install imagemagick"
2. Add gem paperclip GIT - 0fe00ab

### Create Photo Model
1. rails g model Photo room:references 
2. rails g paperclip photo image
3. Add association to rooms and photos models
4. Add configuration to photo.rb from github gem page
5. Add routes for photos in rooms for create and destroy

### Create Photo Controller
1. Create photos_controller.rb
2. Modyfi rooms_controller
3. Add before_action to check if user is room owner GIT - 76654de

### Create Photo View
1. Add form fields for file uploads for photos
2. Add _photos_list.html.erb partail for showing all photos
3. Add some styling for photos upload form

### Remove Photos with AJAX
1. Add rule in .gitignore to ingnore photos GIT - b6d7b06
2. Add fontawesome icons by adding link in head
3. Add link for removing photos in photos_list partial
4. Add destroy action to remove photos
5. Create photos/destroy.js.erb
6. Add http"S" to application helper for FB avatar GIT - fe85e9e

### Amazon S3
1. Create new bucket on S3
2. Create new user IAM
3. Modify development.rb
4. Add keys to figaro
5. Add gem aws-sdk




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
5. Add gem aws-sdk GIT - 61156de

### Add Check to Room Views
1. Add check to sidebar in room creation and logic to display if form was submited
2. Add publish button
3. Add logic only to display publish button when everything is field in and active is false

### Update the Photo Removing with AJAX
1. Add ids to view
2. Add functionality to destroy.js.erb
3. Change room to class variable @room in photos_controller#destroy GIT - c4bc933

### Issue with hidden fields
1. In rooms_controller create private method
2. Merge hash with active: true if room is ready to prevent issue with changing code by user GIT - 

### Create Room Index Page
1. Create rooms/index.html.erb layout
2. Add default photo to listing if it dosent have image
3. Copy blank.jpg to assets/images
4. Create method in model room.rb cover_photo GIT - 1de9808

### Create Room Show Page (1:30)
1. Moddify show.html.erb
2. Add toastr global config in application.js (not fully functional better use different gem)
3. Add styles for strikethrough GIT - 4410740

### Add Google Map
1. Add gem geocoder
2. Add longitude and latitude to room
3. Add geocoded_by :address to room.rb model
4. Restart server and reenter address
4. Add script for google maps without API KEY GIT - d122244

### Add Near-by Rooms
1. Add nearby apartments to show.html.erb using geocoder
2. Added code to enable map loading when changing to nearby room -> (errors in console to solve)
3. Change units to km from miiles in initializers/geocoder.rb GIT - c80b7e6

### Create Reservations Model
1. rails g model Reservation user:references room:references start_date:datetime end_date:datetime price:integer total:integer
2. Add has_many :reservations to user and room
3. Add nested route for reservaions GIT - 171b7a5

### Create Reservations View
1. Add partial to room view
2. Add reservations/_form.html.erb GIT - 46ce499

### Create Reservations Controller
1. Add reservations_controller.rb GIT - 81f043b

### Add jQuery Date Picker
1. Add jquery-ui-rails gem
2. Add js require to application.js
3. Add script to _form.html.erb
4. Add stylesheet in <head> tag for jquery ui theme GIT - a27c5e2

### Refactoring Reservation Form
1. Add styles to right side booking form in room#show
2. Add styles for table in reservation form GIT - 5ea2c87

### AJAX for start date
1. Add preload method in rooms_controller to respond with json
2. Add route for rooms_controller#preload
3. Add AJAX for retriving reservations in _form.html.erb partial
4. Add reservations to calendar
5. Cant select date before and after reservation and remove disabled when selected GIT - 5656f89

### AJAX for end date
1. Add is_conflivt private method in rooms_controller
2. Add action preview in rooms_controller
3. Add route preivew
4. Add js logic in view reservations/_form.html.erb to handle request to rooms/:id/preview
5. Add js logic to display preivew - nights, price, total etc
6. Add css for message GIT - d429a37

### Create Your Trips Page
1. Add action your_trips in reservations_controller
2. Add route for trips
3. Create view for trips GIT - db796aa

### Create Your Reservations Page
1. Add action your_reservations in reservations_controller
2. Add route
3. Add view for reservations
4. Copy sidebar from reservations to trips and listings
5. Update links in shared/_navbar.html.erb
6. Add button to navbar GIT - 849ac49

### Modify User Profile Page
1. Add @rooms to users_controller
2. Modify show.html.erb to show if user confirmed email or signuped with FB
3. Add rooms to profile GIT - 69ef243

### Creating Reviews Model[Complicated]
1. rails g model Review comment:text star:integer room:references reservation:references guest:references host:references type
2. rails g model GuestReview --parent=Review --migration=false
3. rails g model HostReview --parent=Review --migration=false
4. add default: 1 to star in migration
5. add belongs_to :guest, class_name: "User" to guest_review model
6. remove every belongs_to from review.rb model
7. Add has_many :guest_reviews to room.rb and helper method
8. Add has_many :guest_reviews, class_name: "GuestReview", foreign_key: "guest_id" to user.rb as well for Host
9. GIT - bbddd3d

### Creating Reviews Controller[Complicated!!!]
1. Add host_reviews_controller.rb
2. Copy to guest_reviews_controller.rb
3. Add routes GIT - 4370947

### Creating Reviews View
1. Get code for bootstrap modal
2. Create views/reviews/_guest_form.html.erb
3. Create views/reviews/_host_form.html.erb
4. Add button to your_trips with partial
5. Add button to your_reservations partial
6. Change modal id to be dynamic in views GIT - bfd068b

### Create Show Reviews Page
1. Add instance variable to rooms_controller
2. Add instance variable to users_controller to display reviews as aguest and as a host
3. Create reviews/_guest_list.html.erb
4. Create reviews/_host_list.html.erb
5. Update room page and user page with comments partials GIT - b18f765

### Adding jquery raty
1. Create jquery.raty.js and paste from [Raty](https://github.com/wbotelhos/raty/blob/master/lib/jquery.raty.js)
2. Add images from folder from tutorial to assets/images

### Add stars to reviews
1. Add stars to guest_form and host_form
2. Add stars to rooms/show.html.erb
3. Add stars to guest_list and host 
4. Add id for modals GIT - a2bd81e

### Update Home Page
1. Add @rooms to pages_controller.rb
2. Modify pages#home view
3. Add search form to home view
4. Add jquery for datepicker GIT - d3df3d7

### Creating Search Page
1. In page controller add action search
2. Add search to routes.rb
3. Add file views/pages/search.html.erb
4. Add stylesheet rules for search page
5. Add search fields to view search.html.erb GIT - e3ce7e0

### Create search function
1. Add gem 'ransack'
2. Implement search in pages_controller.rb
3. Add code to search.html.erb to display results GIT - 53ba74a

### Add Google Map
1. Transform search criteria to look better on search.html.erb
2. Add button to hide and open filters
3. Add google map with all found rooms
4. Add css for class of map markers
5. Add search form to navbar GIT - f656a6f

### AJAX Searching
1. Create rooms/_room_list.html.erb
2. Create /pages/search.js.erb
3. Change serach.html.erb
4. Update google map with ajax GIT - 
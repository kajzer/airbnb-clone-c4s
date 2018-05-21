# Airbnb clone Airpikachu



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
4. Update google map with ajax GIT - 0af3739

### Add jquery pricing slider
1. Add require rule to assets/application.js
2. Add jquery to search.html.erb for sliders
3. Add some styling with jquery GIT - 8a3b0fa

### Modify Home Page
1. Add images and h1 to home.html.erb
2. Add images to assets/images
3. Add stylesheet css rules GIT - 21d9566

### Improving Home Page
1. Change home page with partial
2. Change show user to use partial
3. Add some information to _rooms_list.html.erb partial
4. Add script for stars and reviews count GIT - b7a926d

### Auto Location Suggestion
1. Use [geocmplete](https://github.com/ubilabs/geocomplete)
2. Get google maps api key
3. Add link to application.html.erb
4. Create geocomplete.js file in javascripts and copy contents from geocomplete github
5. Add id to form in home.html.erb and script
6. Add css to hide scrollbars in search
7. Add autolocation to manage listing 

### Final commit of Airpikachu GIT - eb40636

# ----------Airkong------------------

### Dashboard Controller
1. Change name to AirKong in navbar and layout:P
2. Add dashboards_controller.rb
3. Add route for index action in dashboards_controller
4. Add rule for devise to redirect to dashboar after user sign in GIT - 6802074

### Dashboard View
1. Add views/dashboards, add index.html.erb
2. Additional - add link to user profile in rooms/show.html.erb - not in tutorial
3. Add simple structrue to the dashboard
4. Add style to navbar and more links in dropdown
5. Add additional navbar for sign in users on specific pages
6. Add active links to new navbar GIT - cadab30

### Create acc on twilio.com

### SMS Configuration
1. Add gem twilio-ruby
2. Create file in initializers twilio.rb
3. Add twilio acc info to application.yml (figaro)
4. rails g migration AddPinAndPhoneVerifiedToUser pin phone_verified:boolean
5. Add generate_pin, send_pin, verify_pin in user.rb model GIT - b249c73

### SMS Controller
1. Create update_phone_number, verify_phone_number actions in users_controller
2. Add routes GIT - e3362cb

### SMS View
1. Modify views/devise/registrations/edit.html.erb
2. Add modals for verification and updating phone number [some validations would be nice]
3. Add icon for phone number verification in dashboards/index and users/show GIT - c426a61

### Instant/Request Booking Model
1. rails g migration AddInstantToRooms instant:integer
2. rails g migration AddStatusToReservations status:integer
3. add code to migrations for default value
4. Add enum attributes to room and reservation model GIT - feb8e01

### Instant/Request Booking Function
1. Add :instant in room_params in rooms_controller
2. Add Booking Type select to rooms/new.html.erb
3. Add Booking Type select to rooms/listing.html.erb
4. Add logic to reservations_controller
5. Add diffrent buttons to reservaions/_form.html.erb GIT - dbbf31f

### Approve/Decline Reservations
1. Create approve and decline in reservaions_controller
2. Add routes for new actions
3. Add buttons for approving/declining in reservations/your_reservations
4. Show status in your_trips.html.erb GIT - f97f6e7

### Reservation status
1. Add conditional to show review button only on approved reservations in views
2. Update logic on reservation form in rooms_controller
3. Update search action in pages_controller GIT - 5deddf6

### Calendar Controller
1. Add gems fullcalendar-rails and momentjs-rails [link](https://github.com/bokmann/fullcalendar-rails)
2. Implement js and css in application.js and .scss
3. Create calendars_controller.rb
4. Add routes GIT - a98c0b7

### Host Calendar Page
1. Create calendars/host.html.erb
2. Correct image display in calendar controller
3. Add css for calendar GIT - 96ce3af

### Improving Host Calendar
1. Add date checking in js in host.html.erb for dates so the reservation will display correctly
2. Add search form for changing rooms
3. Add logic to controller for ransack search
4. Asynchronous reload of calendar. Add remote to form in view.
5. Add host.je.erb GIT - bcc8514

### Calendar Next/Back
1. Add js to host.html.erb to trigger on change when pressing next/prev buttons
2. Add host calendar link to navbar GIT - 2415af6

### Calendar avaliability model
1. Add price display to host calendar
2. Add css for price
3. rails g model Calendar day:date price:integer status:integer room:references
4. Add relation to room.rb
5. Add enum to calendar.rb
6. Add routes as nested resource in rooms GIT - f4c397c

### Calendar Availability Form
1. Add /calendars/_form.html.erb
2. Add form to host calendar
3. Add js code for opening modal GIT - 4cbcd52

### Calendar Pricing
1. Add style for radio buttons
2. Add create action and calendar_params to calendars_ccontroler
3. Modify host action in calendars_controller
4. Add in dayRender function in host.html.erb to add days data to calendar
5. Add reloading for arrows to host.js.erb GIT - 8adeb1b

### Stripe
1. Add gem stripe and rails-assets-card
2. Add require card to application.js
3. Create initializers/stripe.rb
4. Add keys to application.yml
5. rails g migration AddStripeIdToUser stripe_id GIT - 2d57b03

### Payment Controller
1. Add payment and add_cart actions in users_controller
2. Add routes GIT - 02bbbd2

### Payment Form
1. Add users/payment.html.erb
2. Add link to navbar
3. Correct cvv to cvc in users_controller GIT - 862ccbc

### Reservation Charges
1. Add privte charge method in reservation_controller
2. Modify create action to use charge method GIT - 201e481

### Improving Payment Form
1. Remove existing form from payment.html.erb
2. Problems with AddBlocker
3. Copy css,js from code4startup becasue stripe changed the way
4. Change users_controller GIT - 528925a

### Stripe Connect
1. Configure Stripe Connect for payment
2. Add gem 'omniauth-stripe-connect'
3. Add omniauth configuration for stripe to initializers/devise.rb
4. rails g migration AddMerchantIdToUser merchant_id GIT - c5b0697

### Payout Process
1. Cerate helper stripe_express_path
2. Create payout action in users controller as well route
3. Create stripe connect callback action in omniauth_callbacks_controller GIT - 58189a6

### Payout Page
1. Create view users/payout.html.erb
2. Test connecting account to stripe
3. Create link to go to dashboard in stripe for hosts GIT - 871c999

### Revenue Splitting
1. Add revenue spliting in reservations_controller
2. Create method in user.rb to check if host is active
3. Add to room_controller if statment to check if stripe is conected GIT - 39eabc1

### Revenue Chart Settings
1. Add gem chartkick
2. Add require rules to application.js
3. Add scope to reservations model
4. Create revenues_controller 
5. Add route for revenues controller GIT - 374a132

### Revenue Chart Page
1. Create revenues/index.html.erb view
2. Add link to shared/navbar for charts
3. Make nicer chart with all days of the week
4. Add by myself month revenue chart GIT - 7bd65fe

### Sending SMS for Successful Booking
1. In reservation_controller write private method for sending sms
2. Add send_sms to charge method GIT - cf9791b

### Sending Email for a Successful Booking
1. Create mailers/reservation_mailer.rb - getemoji.com
2. Create folder in views/reservation_mailer
3. Cerate file send_email_to_guest.html.erb
4. Add line for sending email in reservaions_controller GIT - 7b5ac7b

### Settings Model
1. rails g model Setting enable_sms:boolean enable_email:boolean user:references
2. Add default: true to migration
3. Add loop to migration to add settings to users
4. Add association to user.rb and add_setting method GIT - a7075d4

### Settings Controller
1. Cerate settings_controller.rb
2. Add routes for settings controller actions
3. Add logic to reservation_controller to incorporate settings GIT - 92b10df

### Settings View
1. Create view/settings
2. Add file edit.html.erb
3. Add path for settings in views of payout and payment GIT - aa927ec

### Conversations and Messages Model
1. rails g model Conversation sender_id:integer recipient_id:integer
2. rails g model Message context:text user:references conversation:references
3. Add relations, scopes and validations to converstaion.rb model
4. Add validation to message.rb model and add convertion of time GIT - e178fa2

### Conversations and Messages Controller
1. Create file conversations_controller.rb
2. Create messages_controller.rb
3. Add routes for controllers GIT - 3c22a2b

### Conversations and Messages View
1. Create conversations folder and index.html.erb
2. Create messages folder and indext.html.erb
3. Add link to conversations in users/show view
4. Add message link in shared/navbar
5. Some fixex of typos content changed to context
6. Add partial for messages
7. Change displaying of time to time_ago_in_words GIT - 6ef7cac

### Action Cable Configuration
1. In routes.rb mount ActionCable server
2. Establish socket connection for client side in application.js
3. Specify socekt uri in config/enviroments/development.rb
4. Add ActionCable metatag in application.html.erb GIT - 73ac43f

### Real time messages
1. rails g channel messages
2. add stream_from to channels/messages_channel.rb
3. Define when should channel braodcast in messages_controller.rb
4. Modify assets/javascripts/channels/messages.coffee
5. In messages/index.html.erb add remote: true
6. Change messages coffe to incorporate $() to load javascript better GIT - 66d9f90

### Notification Model
1. rails g model Notification content user:references
2. rails g migration AddUnreadToUser unread:integer
3. Add default: 0 to unread migration
4. Add relationships to user.rb model
5. Add after_create_commit to notification.rb model
6. Add cerate_notification in message.rb model
7. Add create_notification in reservation.rb model GIT - 5fb5069

### Notification Controller
1. Add notifications_controller.rb
2. rails g channel notifications
3. Add code to notifications.coffee
4. Modify notifications_channel.rb
5. rails g job notification
6. Modify jobs/notification_job.rb
7. Add route for notifications in routes.rb GIT - a0aef33

### Improving Notification View... Notification View is after this chapter
1. Add icon to shared/_navbar
2. Add css for new class in application.scss
3. Add code to show up number of notifications to notifications.coffee

### Notification View... forgot before last chapter
1. Add notifications folder
2. Add index.html.erb for notifications
3. Create partial for notification
4. Add Notification count to dashboars/index.html.erb
5. Add hidden field with user id to layouts/application.html.erb

### Ending Improving Notification
1. GIT - b47699b

### Update Room Searching Function
1. Update pages_controller.rb GIT - fd81f3f

### Unavailable Dates on Date Pickers
1. Add logic to get unavailable_dates in rooms_controller
2. Add javascript to reservations/_form.html.erb
3. Update is_conflict method in rooms_controller
4. Clean up code in _form.html.erb GIT - 654cc4a

### Special Price When Booking
1. Modify rooms_controller.rb
2. Modify views/reservations/_form.html.erb
3. Update reservations_controller.rb to reflect special price GIT - 4c4ebb9

# ----------Airgodzilla------------------

### Create new API project
1. Not creating trying to combine both
2. rails new AirGodzilla --api
3. Add gems to gemfile: rack-cors, devise, omniauth, paperclip, geocoder, stripe
4. Create file initializers/cors.rb GIT - 3a9493a

### Adding existing database
1. Copy all files for models from on to secon project (I had one so no copying)
2. Copy db folde contents
3. Copy images from public if not using S3
4. Comment out in notification.rb line after_create_commit
5. You can connect to diffrent db according to this [tutorial](https://www.mayankmishra.me/hooking-up-a-rails-app-with-an-existing-mysql-database/)

### Facebook Access Token
1. rails g migration AddAccessTokenToUsers access_token
2. Add gem 'active_model_serializers' and gem 'koala'
3. Create initializers/koala.rb GIT - b5eeebd

### User Authentication
1. In course he is creating new application_controller. I created base_controller according to [GITHUB](https://github.com/vasilakisfil/rails5_api_tutorial)
2. Add to model user.rb
3. Create controllers/concerns/authenticate.rb GIT - 705277f

### Create User Controller
1. Create users controller.rb in api/v1/. Fill with info from [tutorial](https://vasilakisfil.github.io/rails5_api_tutorial/) 
2. Add routes for new actions in controller GIT - fc06cee

### Testing Facebook Token
1. With postman and [facebook](https://developers.facebook.com/tools/debug/accesstoken/)
2. In postman pass raw json object with { "facebook_access_token": "value copied from fb debug" } as post request GIT - ade8156

### Room List
1. Create rooms_controller in api/v1
2. Add route for rooms in routes.rb GIT - c8ca885

### Room Details
1. Create serializers folder
2. Create room_serializer.rb
3. Add sohw action in rooms_controller in api namespace
4. Check with postman GIT - cc576ef

### Payment Controller
1. Copy initializers/stripe.rb (allready have it)
2. Add add_card action in api/v1/users_controller.rb
3. Add payments route GIT - 

### Booking Room Controller
1. 
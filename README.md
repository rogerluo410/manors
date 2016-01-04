#README   

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...   


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.       

#Setup Marons environment    
1. Create Marons    
`rails new marons --skip-active-record`, then, `bundle install`         
rails version is bigger than 4.2.   

2. Add MongoDB access suite in Rails via `bundle install`       
```
In gemfile:

gem 'mongoid', '~>5.0.0'
gem "bson_ext"
```  
and, create mongoDB configuring file `./config/mongoid.yml` with command `rails g mongoid:config`     

#Establishing process  
* Create model  ->  `rails g model User`   
* Create controller -> `rails g controller users`   


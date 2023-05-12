### School Management System

This is a sample application for the creation and management of schools, courses, batches, and students.

### Prerequisites
* Ruby 2.7.4
* Rails 6.1.7
* PostgreSQL

### Getting Started

To get started with the app,

#### 1. First clone the repo and cd into the directory
```
https://github.com/Thirumal-Sakthivel/school_management.git
cd school_management
```

#### 2. Create database.yml file
```
cp config/database.yml.sample config/database.yml
```

#### 3. Install Gems
```
bundle install
```

#### 4. Install JavaScript dependencies
```
yarn install
```

#### 5. Create and setup the database
```
rails db:create
rails db:migrate
rails db:seed
```

#### 6. Start the Rails server
```
rails s
```
And now you can visit the site with the URL http://localhost:3000

### To run the Rspec tests
```
bundle exec rspec spec/models
```

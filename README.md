## Car Repair Appointment
A Ruby on rails app that creates car repair appointments, stores them in a SQLite database, and communicates with users through emails.

##### Prerequisites
    * Github
    * Ruby 2.7.2
    * Rails 6.0.3.4
    * SQLite3
    * Yarn
    * Node.js

##### 1. Check out the repository

```bash
git clone https://github.com/MCommins/Car-Repair-Appointment.git
```

##### 2. Create and setup the database

Run the following command to create and setup the database.

```ruby
bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

And now you can visit the site with the URL http://localhost:3000

##### 4. Running tests

You can run tests using the following command.

```ruby
rails test <test-file-path>:<line-in-file-where-test-starts>
```
For example, this command runs the first test in the model test file for appointments

```ruby
rails test test/models/appointment_test.rb:5
```

IMPORTANT! Because this app uses SQLite, which does not handle multiple requests simultaneously, there may be instances where a test might throw an error because of a timeout waiting for the database. This is most noticeable when running multiple tests at the same time. For this reason, the system test "updating an Appointment" always blocks. However, running the server and replicating the test manually shows that the app is performing correctly.

##### Notes
   * You can view previews of the emails sent by the application at http://localhost:3000/rails/mailers/appointment_mailer
   * It is possible to visit the 'appointments/:id/edit' path directly without being redirected by the activation email. This is for ease of testing, but it would be fixed in production.
   * If running controller unit tests and receiving SQLite blocking errors, run them again. The tests pass when they do not block, and the blocking appears to be inconsistent.

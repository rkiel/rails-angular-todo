## Angular Rails

Connect to the vagrant server.

```unix
vagrant ssh rails
cd /vagrant
```

Install the gems.

```unix
bundle install
```

Initialize the database.

```unix
rake db:migrate
rake db:migrate RAILS_ENV=test
```

Start the rails server.

```unix
rails server -b 192.168.33.10
```

Open up your browser.

[http://192.168.33.10:3000](http://192.168.33.10:3000)

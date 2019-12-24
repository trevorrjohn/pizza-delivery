# Setup

Requires Ruby 2.+

# Run

```
$ ruby runner.rb
=> Number of houses using 1 worker: 2565
   Number of houses using 2 worker: 2639
```

Optionally you can pass the instructions filename as an argument

```
$ ruby runner.rb instructions.txt
=> Number of houses using 1 worker: 2565
   Number of houses using 2 worker: 2639
```

## Run tests

```
$ bundle install
$ bundle exec rspec .

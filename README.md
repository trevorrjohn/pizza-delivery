# Setup

Requires Ruby 2.+

# Run

```
$ ruby runner.rb
=> Maria delivered to 1348 houses
   Clovis delivered to 1490 houses
   For a total of 2639 houses
```

Optionally you can pass the instructions filename as an argument

```
$ ruby runner.rb instructions.txt
=> Maria delivered to 1348 houses
   Clovis delivered to 1490 houses
   For a total of 2639 houses
```

Optionally you can pass the names of the workers, however you must specify the instructions file

```
$ ruby runner.rb instructions.txt Maria
=> Maria delivered to 2565 houses
   For a total of 2565 houses

# Or with more workers

$ ruby runner.rb instructions.txt Maria Clovis Sam
=> Maria delivered to 1013 houses
   Clovis delivered to 1024 houses
   Sam delivered to 1004 houses
   For a total of 2600 houses
```

## Run tests

```
$ bundle install
$ bundle exec rspec .

# MTFV Manager

a tool for managing sportsmanager because reasons.

## find inactive players

```ruby
club = Club.first
ip = InactivePlayers.new(club: club)
ip.call
```

## setting dates for matches

```ruby
z = [
  Time.new(2021, 8, 29, 11, 00, 00, "+00:00"),
  Time.new(2021, 8, 29, 13, 00, 00, "+00:00"),
  Time.new(2021, 8, 29, 15, 00, 00, "+00:00"),
  Time.new(2021, 8, 29, 17, 00, 00, "+00:00"),
  Time.new(2021, 9, 18, 11, 00, 00, "+00:00"),
  Time.new(2021, 9, 18, 13, 00, 00, "+00:00"),
  Time.new(2021, 9, 18, 15, 00, 00, "+00:00"),
  Time.new(2021, 9, 18, 17, 00, 00, "+00:00"),
]

l = League.find(50)
l.matches.each do |m|
  m.zeitpunkt = z[m.spieltag-1]
  m.spielort_id = 13
  m.save
end
```

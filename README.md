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

## move rankings to next season

```ruby
old_season = Season.where(saisonbezeichnung: "2020")
new_season = Season.where(saisonbezeichnung: "2021")
old_season.rankings.each do |r|
  r.saison_id = new_season.id
end
```

## move rankings to next season and extend over multiple years

```ruby
old_season = Season.where(saisonbezeichnung: "2020")
new_season = Season.where(saisonbezeichnung: "2021")
old_season.rankings.each do |r|
  r.saison_id = new_season.id
  r.letzter_tag = Date.new(2021,12,31)
end
```

## check next player number for various states

```ruby
NextPlayerNumber.new(state: :sachsen).call
```

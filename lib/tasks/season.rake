namespace :season do
  desc "This task does nothing"
  task :generate => [ :environment ] do
    season = Season.where(saisonbezeichnung: ENV['SEASON']).first
    if season.nil?
      abort("Season not found")
    end

    season.leagues.each do |league|
      p "season #{season.saisonbezeichnung} with #{league.teams.count} teams"
    end
    # p season
  end
end

__END__

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

l.matches.each do |m|
  m.zeitpunkt = z[m.spieltag-1]
  m.spielort_id = 13
  m.save
end

l.matches.select { |m| m.spieltag > 5 }.collect(&:destroy)

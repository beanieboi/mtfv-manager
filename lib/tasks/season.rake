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

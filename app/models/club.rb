class Club < ApplicationRecord
  self.table_name = TABLE_PREFIX + "verein"

  has_many :club_memberships, foreign_key: "verein_id"
  has_many :players, through: :club_memberships
  has_many :teams, foreign_key: "verein_id"

  has_many :active_players, -> do
    where(ClubMembership.table_name => {:mitgliedsstatus => [1,2,3]}).
    where(ClubMembership.table_name => {:ausgetreten => false})
  end, through: :club_memberships, source: :player

  scope :active, -> { where(ausgetreten: false) }

  def teams_in_season(season)
    teams.where(veranstaltung_id: season.leagues.collect(&:id))
  end

  def players_in_season(season)
    teams_in_season(season).collect(&:players).flatten
  end
end

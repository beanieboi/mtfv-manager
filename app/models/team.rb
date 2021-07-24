class Team < ApplicationRecord
  self.table_name = TABLE_PREFIX + "team"

  belongs_to :club, foreign_key: "verein_id"
  belongs_to :league, foreign_key: "veranstaltung_id"

  has_many :team_memberships
  has_many :players, through: :team_memberships

  has_many :home_matches, class_name: "Match", foreign_key: "heim_team_id"
  has_many :away_matches, class_name: "Match", foreign_key: "gast_team_id"

  def matches
    home_matches.or(away_matches)
  end
end

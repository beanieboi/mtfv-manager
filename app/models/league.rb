class League < ApplicationRecord
  self.table_name = TABLE_PREFIX + "veranstaltung"

  belongs_to :season, foreign_key: "saison_id"
  has_many :teams, foreign_key: "veranstaltung_id"

  has_many :home_matches, through: :teams
  has_many :away_matches, through: :teams

  def matches
    home_matches & away_matches
  end
end

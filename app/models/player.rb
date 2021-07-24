class Player < ApplicationRecord
  self.table_name = TABLE_PREFIX + "spieler"

  has_many :team_memberships, foreign_key: "spieler_id"
  has_many :club_memberships, foreign_key: "spieler_id"

  has_many :teams, through: :team_memberships
  has_many :clubs, through: :club_memberships
end

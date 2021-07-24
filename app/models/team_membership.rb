class TeamMembership < ApplicationRecord
  self.table_name = TABLE_PREFIX + "mitglied_von_team"

  belongs_to :team
  belongs_to :player, foreign_key: "spieler_id"
end

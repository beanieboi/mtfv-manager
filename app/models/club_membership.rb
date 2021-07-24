class ClubMembership < ApplicationRecord
  self.table_name = TABLE_PREFIX + "mitglied_von_verein"

  belongs_to :club, foreign_key: "verein_id"
  belongs_to :player, foreign_key: "spieler_id"

  scope :active, -> { where(mitgliedsstatus: 0) }

  # mitgliedsstatus
  # 1 aktiv
  # 2 eingeschränkt
  # 3 passiv
  # 0 ausgetreten
end

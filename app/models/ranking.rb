class Ranking < ApplicationRecord
  self.table_name = TABLE_PREFIX + "rangliste"

  belongs_to :season, foreign_key: 'saison_id'

end

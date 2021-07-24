class Season < ApplicationRecord
  self.table_name = TABLE_PREFIX + "saison"

  has_many :leagues, foreign_key: "saison_id"
  has_many :rankings, foreign_key: "saison_id"
end

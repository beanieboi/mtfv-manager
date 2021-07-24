class Match < ApplicationRecord
  self.table_name = TABLE_PREFIX + "begegnung"

  belongs_to :location, foreign_key: :spielort_id
end

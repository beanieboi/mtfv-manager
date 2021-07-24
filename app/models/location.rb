class Location < ApplicationRecord
  self.table_name = TABLE_PREFIX + "spielort"

  has_many :matches, foreign_key: :spielort_id
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  TABLE_PREFIX = "xvnsd_sportsmanager_"
end

class RoleModelRecord < ApplicationRecord
  self.table_name = 'role_models'

  class << self
    def all_role_models
      self.all.order(created_at: :desc)
    end
  end
end

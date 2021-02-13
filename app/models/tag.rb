class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :role_models, through: :tag_maps
  validates :name, uniqueness: true
end

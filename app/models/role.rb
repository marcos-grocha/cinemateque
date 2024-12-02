class Role < ApplicationRecord
  validates :description, presence: true
  belongs_to :actor
end

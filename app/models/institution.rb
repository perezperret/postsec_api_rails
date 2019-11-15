class Institution < ApplicationRecord
  PER_PAGE = 20

  validates :ipeds_id, presence: true, uniqueness: true
  validates :name, presence: true

  paginates_per PER_PAGE
end

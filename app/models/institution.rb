class Institution < ApplicationRecord
  PER_PAGE = 20

  include PgSearch::Model

  validates :ipeds_id, presence: true, uniqueness: true
  validates :name, presence: true

  paginates_per PER_PAGE

  pg_search_scope :search,
                  against: %i[name alias],
                  using: {
                    tsearch: { dictionary: 'english', prefix: true }
                  }
end

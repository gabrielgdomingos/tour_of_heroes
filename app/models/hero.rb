class Hero < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, uniqueness: { case_sensitive: false }

  scope :search, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") if name.present? }
  scope :sorted_by_name, -> { order(:name) }
end

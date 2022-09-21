class Article < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 6 }
end

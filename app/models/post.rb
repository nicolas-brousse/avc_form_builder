class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :published_at, presence: true
end

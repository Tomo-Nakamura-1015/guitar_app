class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :content, presence: true
  validates :title, presence: true
end

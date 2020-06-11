class Comment < ApplicationRecord
  belongs_to :post
  validates :content, presence: true, length: { minimum: 3}
end

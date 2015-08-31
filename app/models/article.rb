class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :title, :content, presence: :true, length: {minimum: 5}
end

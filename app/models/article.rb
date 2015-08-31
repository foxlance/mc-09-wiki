class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :content, presence: :true, length: {minimum: 5}
end

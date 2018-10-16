class Entry < ApplicationRecord
  belongs_to :feed
  has_many :microposts, dependent: :destroy

  validates :title,  presence: true, length: { maximum: 255 }
  validates :content,  presence: true
end

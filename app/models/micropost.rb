class Micropost < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :entry, optional: true
  validates :user_id, presence: true
  validates :entry_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end

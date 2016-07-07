class Micropost < ApplicationRecord
        validates :content, length: { maximum: 50 }, presence: true
        belongs_to :user
end

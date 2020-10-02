class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true
    validates :user_id, presence: true


end
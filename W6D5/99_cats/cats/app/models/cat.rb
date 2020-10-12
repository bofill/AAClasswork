require 'action_view'
require 'action_view/helpers'
class Cat < ApplicationRecord 
    include  ActionView::Helpers::DateHelper
COLOR = %w(red white gray black)
validates :color, inclusion: { in: COLOR }
validates :sex, inclusion: { in: ['M', 'F'] }

def age 
    time_ago_in_words( self.birth_date )
end

has_many :rentals, 
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end 

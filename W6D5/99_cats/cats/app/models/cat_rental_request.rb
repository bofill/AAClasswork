class CatRentalRequest < ApplicationRecord
    validates :status, inclusion: {in: %w(PENDING APRROVED DENIED)}
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :cat_id, presence: true

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat

    def overlaping_request
        CatRentalRequest
            .where(cat_id: self.cat_id)
            .where('(? BETWEEN cat_rental_request.start_date AND cat_rental_request.end_date) AND (? BETWEEN cat_rental_request.start_date AND cat_rental_request.end_date)', self.end_date, self.start_date)
    end 
end
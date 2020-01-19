class Ticket < ApplicationRecord
    validates :name, :presence => true, :length => { :minimum => 6 }
    validates :email_address, :presence => true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :price, :presence => true
    validates :address, :presence => true
    validates :seat_id_seq, :presence => true
    validates :phone, :presence => true

    belongs_to :event
    belongs_to :user

    validate :paid_in_range

    private

    def paid_in_range
        if price < event.price_low or price > event.price_high
            errors.add('Cena', 'musi byc w zasiegu')
        end
    end
end

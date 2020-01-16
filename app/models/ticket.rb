class Ticket < ApplicationRecord
    validates :name, :presence => true, :length => { :minimum => 6 }
    validates :email_address, :presence => true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :price, :presence => true
    validates :address, :presence => true
    validates :seat_id_seq, :presence => true
    validates :phone, :presence => true

    belongs_to :event
end

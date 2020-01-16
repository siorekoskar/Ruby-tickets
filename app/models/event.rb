class Event < ActiveRecord::Base
    validates :artist, :presence => true
    validates :description, :presence => true
    validates :price_low, :presence => true, :numericality =>true
    validates :price_high, :presence => true, :numericality =>true
    validates :event_date, :presence => true

    validate :event_date_not_from_past
    private
    def event_date_not_from_past
        puts "CIPKAA"
        if event_date < Date.today
            errors.add('Data wydarzenia', 'nie może być z przeszłości')
        end
    end

    has_many :tickets
end


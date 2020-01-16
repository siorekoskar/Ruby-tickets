class Event < ActiveRecord::Base
    validates :artist, :presence => true
    validates :description, :presence => true
    validates :price_low, :presence => true, :numericality =>true
    validates :price_high, :presence => true, :numericality =>true
    validates :event_date, :presence => true

    validate :event_date_not_from_past
    validate :price_low_not_higher_than_high

    private
    def event_date_not_from_past
        if event_date < Date.today
            errors.add('Data wydarzenia', 'nie może być z przeszłości')
        end
    end

    def price_low_not_higher_than_high
        if price_high < price_low
            errors.add('Cena minimalna', 'nie moze byc wieksza niz najwieksza')
        end
    end

    has_many :tickets
end


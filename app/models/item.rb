class Item < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :quantity, presence: true
  
    after_initialize :set_defaults, unless: :persisted?
  
    private
  
    def set_defaults
      self.quantity ||= '1 un'
      self.purchased ||= false
    end
  end
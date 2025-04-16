class Item < ApplicationRecord
    validates :name, presence: true, lenght: ( minimum: 2 )
    validades: :quantity, presence: true

    # Garante os valores padrão mesmo se forem criados via new/save em vez de create
    after_initialize :set_defaults, unless: :persisted?

    private

    def set_defaults
        self.quantity ||= '1 un'
        self.purchased ||= false
end

class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end

  def valid?
   if  order.line_items.length <= 0
     return false
   else
     return true
   end

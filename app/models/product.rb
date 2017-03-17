class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def average_rating(product)
    average = product.reviews.average(:rating).to_i.round(2)
    return average != 0 ? average : "No ratings yet"
  end



end

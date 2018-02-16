class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    where('inventory != ?', 0)
  end

  def price_in_dollars
    "$#{(self.price).to_f/100}"
  end

end

class Brew < ApplicationRecord
  has_many :purchases
  def self.strongest
    Brew.order(:strength).last
  end
end

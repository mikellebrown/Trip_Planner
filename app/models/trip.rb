class Trip < ApplicationRecord
  belongs_to :user

  has_many :locations do
  has_many :addresses
  end
end

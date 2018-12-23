class Review < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  has_many :stars
end

class Image < ApplicationRecord
belongs_to :user
attachment :image
end

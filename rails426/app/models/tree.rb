class Tree < ActiveRecord::Base
  has_many :birds, dependent: :destroy
end

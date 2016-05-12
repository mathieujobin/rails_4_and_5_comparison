class Bird < ActiveRecord::Base
  belongs_to :tree
  has_many :feathers, dependent: :destroy
end

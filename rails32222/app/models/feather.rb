class Feather < ActiveRecord::Base
  belongs_to :bird
  attr_accessible :color, :length
end

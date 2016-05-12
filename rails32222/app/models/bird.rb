class Bird < ActiveRecord::Base
  belongs_to :tree
  attr_accessible :name
end

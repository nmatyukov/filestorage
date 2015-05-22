class Tag < ActiveRecord::Base
  has_many :references
  has_many :documents, through: :references
end

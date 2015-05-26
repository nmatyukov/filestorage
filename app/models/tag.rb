class Tag < ActiveRecord::Base
  include Scoped

  has_many :references
  has_many :documents, through: :references

end

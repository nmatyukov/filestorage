class Document < ActiveRecord::Base

  belongs_to :user
  has_many :references
  has_many :tags, through: :references

  mount_uploader :files, FileUploader
end

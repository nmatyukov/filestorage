class Document < ActiveRecord::Base

  belongs_to :user
  has_many :references
  has_many :tags, through: :references

  mount_uploader :files, FileUploader

  def self.store_files(params)
    if params[:files].kind_of?(Array)
      params[:files] = params[:files].first
    end
    self.new( params )
  end
end

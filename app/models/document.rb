class Document < ActiveRecord::Base

  include Scoped

  PAGINATION_PER_PAGE = 10

  belongs_to :user
  has_many   :references
  has_many   :tags, through: :references

  validates :title, presence: true, allow_blank: false

  mount_uploader :files, FileUploader

  self.per_page = PAGINATION_PER_PAGE

  # Convert Array of files to single file
  #
  # @param [Hash] params from request
  def self.prepare_files(params)
    if params[:files].kind_of?(Array)
      params[:files] = params[:files].first
    end
    params
  end
end

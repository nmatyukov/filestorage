class Document < ActiveRecord::Base

  include Scoped

  PAGINATION_PER_PAGE = 10

  belongs_to :user
  has_many   :references
  has_many   :tags, through: :references

  validates :title, presence: true, allow_blank: false
  accepts_nested_attributes_for :tags

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

  # Convert String of tags to Array
  #
  # @param [Hash] params from request
  def self.prepare_tags(params)
    if params[:tags].empty?
      params[:tags] = []
    else
      params[:tags] = params[:tags].split(',').map do |tag|
        self.tags << Tag.where(name: tag.strip).first_or_create
      end
    end
    params
  end

end

class Tag < ActiveRecord::Base
  include Scoped

  has_many :references
  has_many :documents, through: :references

  # Convert String of tags to Array
  #
  # @param [Hash] params from request
  def self.prepare_tags(params)
    if params[:tags].empty?
      params[:tags] = []
    else
      params[:tags] = params[:tags].split(',').map do |tag|
        self.where(name: tag.strip).first_or_create
      end
    end
    params
  end
end

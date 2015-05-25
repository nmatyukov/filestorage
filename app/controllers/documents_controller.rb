class DocumentsController < ApplicationController

  def index
  end

  def create
    @document = Document.new(name: params[:name])
    @document.path = params[:file]
    @document.save!
    render :nothing => true
  end

end

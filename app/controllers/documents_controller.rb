class DocumentsController < ApplicationController

  def index
    @document = Document.new
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(name: params[:name])
    @document.path = params[:file]
    @document.save!
    render :nothing => true
  end

end

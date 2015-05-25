class DocumentsController < ApplicationController

  def index
    @documents = Document.paginate(
      page: params.permit(:page)[:page]
    )
  end

  def create
    @document = Document.store_files(document_params)
    if @document.save
      render nothing: true
    else
      render json: [
        {errors: "File not saved due to #{@document.errors.full_messages.first}"}
      ], status: 500
    end
  end

  def destroy
    @document = Document.where(id: params.permit(:id)[:id]).first
    @document.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def download_file
    @document = Document.where(id: params.permit(:id)[:id]).first
    send_file(@document.files.path,
              disposition: 'attachment',
              url_based_filename: false)
  end

  def tag_filter
    @documents = Tag.where(id: params.permit(:id)[:id])
                    .first
                    .documents
    @documents = @documents.paginate(
      page: params.permit(:page)[:page]
    )
    respond_to do |format|
      format.html { 
        render template: "documents/index"
      }
    end
  end

  private

    def document_params
      params.permit(:title, :tags, {files: []})
    end
end

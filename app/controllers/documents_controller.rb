class DocumentsController < ApplicationController

  def index
    @documents = current_user.documents.paginate(
      page: permitted_page
    )
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      current_user.documents << @document
      render nothing: true
    else
      render json: [
        {
          errors: "File not saved: #{@document.errors.full_messages.first}"
        }
      ], status: 500
    end
  end

  def destroy
    @document = current_user.documents.first_by(permitted_id)
    @document.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def download_file
    @document = current_user.documents.first_by(permitted_id)
    send_file(@document.files.path,
              disposition: 'attachment',
              url_based_filename: false
             )
  end

  def tag_filter
    @documents = Tag.first_by(permitted_id)
                    .documents.where(user_id: current_user.id)
    @documents = @documents.paginate(
      page: permitted_page
    )
    respond_to do |format|
      format.html {
        render template: "documents/index"
      }
    end
  end

  private

    def document_params
      prepare(params).permit(:title, :tags, {files: []})
    end

    def permitted_id
      params.permit(:id)[:id]
    end

    def permitted_page
      params.permit(:page)[:page]
    end

    def prepare(params)
      params = Tag.prepare_tags(params)
      params = Document.prepare_files(params)
    end

end

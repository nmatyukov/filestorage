class DocumentsController < ApplicationController

  def index
  end

  # {"files"=>[#<ActionDispatch::Http::UploadedFile:0xb37f5c34 @tempfile=#<Tempfile:/tmp/RackMultipart20150525-7106-cnz20x.jpg>, @original_filename="0193MR1024018000E1_DXXX.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"files[]\"; filename=\"0193MR1024018000E1_DXXX.jpg\"\r\nContent-Type: image/jpeg\r\n">]}
  def create
    @document = Document.store_files(document_params)
    if @document.save
      render nothing: true
    else
      render json: [{error: "custom_failure"}], status: 304
    end
  end

  private

    def document_params
      params.permit(:title, :tags, {files: []})
    end
end

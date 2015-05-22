class File < ActiveRecord::Base
  mount_uploader :file, FileUploader
end

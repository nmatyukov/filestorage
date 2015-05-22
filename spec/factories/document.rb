FactoryGirl.define do
  factory :document do
    sequence(:name){ |i| "name_#{i}" }
    path { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', '0193MR1024018000E1_DXXX.jpg')) }

    factory :pdf_document do
      sequence(:name){ |i| "name_#{i}" }
      path { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test.pdf')) }
    end
  end
end

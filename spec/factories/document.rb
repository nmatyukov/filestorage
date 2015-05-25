FactoryGirl.define do
  factory :document do
    sequence(:title){ |i| "name_#{i}" }
    files { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', '0193MR1024018000E1_DXXX.jpg')) }

    factory :pdf_document do
      sequence(:title){ |i| "name_#{i}" }
      files { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.pdf')) }
    end
  end
end

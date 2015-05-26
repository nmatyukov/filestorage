require 'rails_helper'

RSpec.describe Document, type: :model do

  it { should respond_to(:title) }
  it { should respond_to(:files) }

  it { should belong_to(:user) }
  it { should have_many(:references) }
  it { should have_many(:tags).through(:references) }

  it "should be valid" do
    file = FactoryGirl.build(:document)
    expect(file).to be_valid
  end

  it "should not valid if empty title" do
    params = { title: "" }
    file = Document.new(params)
    expect(file).not_to be_valid
  end

  it "should process file in array" do
    params = {
        title: "hello.jpg",
        files: [
          Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.pdf'))
        ]
      }
    params = Document.prepare_files(params)
    file = Document.new(params)
    expect(file).to be_valid
  end

end

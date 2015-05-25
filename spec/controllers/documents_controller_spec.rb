require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do

  describe "POST create" do

    it "works with array of files" do
      post :create, {
        title: "hello.jpg",
        tags: "vk, fb",
        files: [
          fixture_file_upload('/files/0193MR1024018000E1_DXXX.jpg', 'image/jpg')
        ]
      }
      expect(response).to be_success
    end

    it "creates a document with tags" do
      post :create, {
        title: "hello.jpg",
        tags: "vk, fb",
        files: fixture_file_upload(
          '/files/0193MR1024018000E1_DXXX.jpg',
          'image/jpg'
        )
      }
      expect(response).to be_success
    end

    it "creates a document with empty tags" do
      post :create, {
        title: "hello.jpg",
        tags: "",
        files: fixture_file_upload(
          '/files/0193MR1024018000E1_DXXX.jpg',
          'image/jpg'
        )
      }
      expect(response).to be_success
    end

    it "fail if title is empty" do
      post :create, {
        title: "",
        tags: "vk, fb",
        files: [
          fixture_file_upload('/files/0193MR1024018000E1_DXXX.jpg', 'image/jpg')
        ]
      }
      expect(response).to have_http_status(:error)
    end

  end

end

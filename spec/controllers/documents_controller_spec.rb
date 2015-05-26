require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do

  include Devise::TestHelpers

  def user_authorization
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:sample_user)
  end

  describe "POST create" do

    context "unauthorized User" do

      it "should not create a document" do
        post :create, {
          title: "hello.jpg",
          tags: "vk, fb",
          files: fixture_file_upload(
            '/files/0193MR1024018000E1_DXXX.jpg',
            'image/jpg'
          )
        }
        expect(response).to have_http_status(:redirect)
      end

      it "should redirect to sign_in page" do
        post :create, {
          title: "hello.jpg",
          tags: "vk, fb",
          files: fixture_file_upload(
            '/files/0193MR1024018000E1_DXXX.jpg',
            'image/jpg'
          )
        }
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "authorized User" do

      before(:each) do
        user_authorization
      end

      it "works with array of files" do
        post :create, {
          title: "hello.jpg",
          tags: "vk, fb",
          files: [
            fixture_file_upload(
              '/files/0193MR1024018000E1_DXXX.jpg',
              'image/jpg'
            )
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

      it "creates a document with space title" do
        post :create, {
          title: " ",
          tags: "fb",
          files: fixture_file_upload(
            '/files/0193MR1024018000E1_DXXX.jpg',
            'image/jpg'
          )
        }
        expect(response).to have_http_status(:error)
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

  describe "GET index" do
    context "unauthorized User" do
      it "is a unsuccessful index request" do
        get :index
        expect(response).to have_http_status(:redirect)
      end

      it "should redirect to sign_in page" do
        get :index
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "authorized User" do
      before(:each) do
        user_authorization
      end

      it "is a successful index request" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET tag_filter" do

    before(:each) do
      @tag = Tag.where(name: 'fb').first_or_create
    end

    context "unauthorized User" do

      it "should be unsuccessful response" do
        get :tag_filter, {id: @tag.id}
        expect(response).to have_http_status(:redirect)
      end

      it "should redirect to sign_in page" do
        get :tag_filter, {id: @tag.id}
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "authorized User" do

      before(:each) do
        user_authorization
      end

      it "is a successful index request" do
        get :tag_filter, {id: @tag.id}
        expect(response).to have_http_status(:success)
      end
    end
  end

end

require 'rails_helper'

RSpec.describe Tag, type: :model do

  it { should respond_to(:name) }

  it { should have_many(:references) }
  it { should have_many(:documents).through(:references) }

  it "should be valid" do
    tag = FactoryGirl.create(:tag)
    expect(tag).to be_valid
  end

  it "convert String of comma-separated tags to Array" do
    params = { tags: "vk, fb, g+" }
    params = Tag.prepare_tags(params)
    expect(params).not_to be_empty
  end

  it "convert empty String to empty Array" do
    params = { tags: "" }
    params = Tag.prepare_tags(params)
    expect(params[:tags]).to be_empty
  end
end

require 'rails_helper'

RSpec.describe Tag, type: :model do

  it { should respond_to(:title) }

  it { should have_many(:references) }
  it { should have_many(:files).through(:references) }

  it "should be valid" do
    tag = FactoryGirl.create(:tag)
    expect(tag).to be_valid
  end
end

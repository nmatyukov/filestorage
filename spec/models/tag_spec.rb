require 'rails_helper'

RSpec.describe Tag, type: :model do

  it { should respond_to(:name) }

  it { should have_many(:references) }
  it { should have_many(:documents).through(:references) }

  it "should be valid" do
    tag = FactoryGirl.create(:tag)
    expect(tag).to be_valid
  end
end

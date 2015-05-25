require 'rails_helper'

RSpec.describe Document, type: :model do

  it { should respond_to(:title) }
  it { should respond_to(:files) }

  it { should belong_to(:user) }
  it { should have_many(:references) }
  it { should have_many(:tags).through(:references) }

  it "should be valid" do
    file = FactoryGirl.create(:document)
    expect(file).to be_valid
  end
end

require 'rails_helper'

RSpec.describe Document, type: :model do

  it { should respond_to(:name) }
  it { should respond_to(:path) }

  it { should belong_to(:user) }
  it { should have_many(:references) }
  it { should have_many(:tags).through(:references) }

  it "should be valid" do
    pending
    # file = FactoryGirl.create(:document)
    # expect(file).to be_valid
  end
end

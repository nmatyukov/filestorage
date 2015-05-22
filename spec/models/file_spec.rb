require 'rails_helper'

RSpec.describe File, type: :model do

  it { should respond_to(:name) }
  it { should respond_to(:path) }

  it { should belongs_to(:user) }
  it { should have_many(:references) }
  it { should have_many(:tags).through(:references) }

  it "should be valid" do
    file = FactoryGirl.create(:file)
    expect(file).to be_valid
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do

  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }

  it { should have_many(:documents) }

  it "should be valid" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  it "should use email" do
    user = FactoryGirl.build(:no_email_user)
    expect(user).not_to be_valid
  end

  it "email should not be empty" do
    user = FactoryGirl.build(:empty_email)
    expect(user).not_to be_valid
  end

  it "password should not be empty" do
    user = FactoryGirl.build(:empty_password)
    expect(user).not_to be_valid
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do

  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }

  it { should have_many(:files) }

end

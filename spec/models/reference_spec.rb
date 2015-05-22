require 'rails_helper'

RSpec.describe Reference, type: :model do

  it { should belongs_to(:tag) }
  it { should belongs_to(:file) }

end

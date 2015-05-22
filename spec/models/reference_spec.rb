require 'rails_helper'

RSpec.describe Reference, type: :model do

  it { should belong_to(:tag) }
  it { should belong_to(:document) }

end

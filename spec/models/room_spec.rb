require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)  }
    it { should validate_presence_of(:capacity) }
    it { should validate_numericality_of(:capacity).is_greater_than(0) }
  end
end
 

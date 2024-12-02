require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)  }
    it { should validate_presence_of(:date_of_birth)  }
    it { should validate_presence_of(:nationality)  }
  end
end

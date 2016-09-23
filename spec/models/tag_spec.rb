require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:document) { create(:document) }
  let(:tag) { create(:tag) }

  it { should respond_to(:label) }
  it { should respond_to(:context) }
  it { should respond_to(:document) }

  it { should belong_to(:document) }

  describe 'valid Model' do
    it 'should be an instance of Tag Model' do
      expect(tag).to be_an_instance_of(Tag)
    end
  end
end

require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:document) { create(:document) }

  it { should respond_to(:content) }
  it { should respond_to(:file) }

  it { should have_many(:tags) }
  it { should accept_nested_attributes_for(:tags) }

  describe 'valid Model' do
    it 'should be an instance of Document Model' do
      expect(document).to be_an_instance_of(Document)
    end
  end

end
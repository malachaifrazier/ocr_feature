require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:document) { create(:document) }

  it { should respond_to(:content) }
  it { should respond_to(:file) }

  it { should have_many(:tags).dependent('destroy') }
  it { should accept_nested_attributes_for(:tags) }

  it { should validate_attachment_presence(:file) }
  it { should validate_attachment_size(:file).less_than(1.megabytes) }
  it { should validate_attachment_content_type(:file).allowing(
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "application/msword",
        "application/zip"
    ).rejecting('text/plain', 'text/html', 'image/png', 'image/jpg', 'image/jpeg')
  }

  describe 'valid Model' do
    it 'should be an instance of Document Model' do
      expect(document).to be_an_instance_of(Document)
    end
  end

  describe 'tags' do
    it 'should kill tags when doc is killed' do
      document.tags.create
      expect(document.tags.count).to eq 1

      expect{
        document.destroy!
        }.to change(Tag, :count).by(-1)
    end
  end

end
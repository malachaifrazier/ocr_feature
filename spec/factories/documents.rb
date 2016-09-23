FactoryGirl.define do
  factory :document do
    content "MyText"
    file { fixture_file_upload "#{Rails.root}/spec/fixtures/files/DocumentforRailsProjectCodingTest.docx", 'application/docx' }
  end
end
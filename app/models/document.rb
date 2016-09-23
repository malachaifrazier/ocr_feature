class Document < ActiveRecord::Base
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: :true,
    reject_if: proc { |attrs| attrs.all? { |k, v| v.blank? } }

  has_attached_file :file

  validates_attachment :file,
    presence: true,
    content_type: {
      content_type: [
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "application/msword",
        "application/zip"
      ]
    },
    size: { in: 0..1.megabytes }

  after_create :parse_doc

protected

  def parse_doc
    # TODO: pull out it’s content, and find the tags.
      # Document, Content field - store all content from file
      # Tag, Context field - store the related content from the Document where this tag is found that is one sentence before the tag occurs, to one sentence after the tag occurs
  end
end

class Document < ActiveRecord::Base
  has_many :tags
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
end

class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :content
      t.attachment :file

      t.timestamps null: false
    end
  end
end

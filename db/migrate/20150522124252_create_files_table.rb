class CreateFilesTable < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :path

      t.belongs_to :user
    end

    create_table :tags do |t|
      t.string :title
    end

    create_table :references do |t|
      t.belongs_to :document
      t.belongs_to :tag
    end

    add_index :documents,  :user_id,     unique: true
    add_index :references, :document_id, unique: true
    add_index :references, :tag_id,      unique: true
  end
end

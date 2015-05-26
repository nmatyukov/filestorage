class CreateFilesTable < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :files

      t.belongs_to :user
    end

    create_table :tags do |t|
      t.string :name
    end

    create_table :references do |t|
      t.belongs_to :document
      t.belongs_to :tag
    end
  end
end

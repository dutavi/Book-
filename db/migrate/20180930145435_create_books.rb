class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false, default: ""
      t.text :description
      t.string :slug, index: true
    
      t.timestamps
    end
  end
end

class CreatePublications < ActiveRecord::Migration[7.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.boolean :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
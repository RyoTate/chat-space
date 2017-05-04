class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :image
      t.references     :group, foreign_key: true
      t.references     :user, foreign_key: true
      t.integer :group_id
      t.integer :user_id
      t.timestamps
    end
  end
end

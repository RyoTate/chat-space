class AddColumnToMessages < ActiveRecord::Migration[5.0]
  def change
    change_table :messages do |t|
      t.references :user
      t.references :group
    end
  end
end

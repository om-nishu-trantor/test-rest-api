class CreateTasklistings < ActiveRecord::Migration[5.1]
  def change
    create_table :tasklistings do |t|
      t.string :name
      t.integer :count

      t.timestamps
    end
  end
end

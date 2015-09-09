class Initial < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.date :expiry

      t.timestamps
    end
  end
end

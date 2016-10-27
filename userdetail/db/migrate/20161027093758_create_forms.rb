class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :firstName
      t.text :lastName
      t.text :email
      t.text :password

      t.timestamps null: false
    end
  end
end

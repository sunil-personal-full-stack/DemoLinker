class CreateVerifCodes < ActiveRecord::Migration
  def change
    create_table :verif_codes do |t|

      t.text :code
      t.text :user_id
  
      t.timestamps null: false
    end
 
  end
end

class CreateVerificationCodes < ActiveRecord::Migration
  def change
    create_table :verification_codes do |t|
      t.references :code
      t.references :user_id
  
      t.timestamps null: false
    end
  end
end

class AddCodeVerifierToUsers < ActiveRecord::Migration
  def change
  	add_column :users , :verif , :string
  end
end

class AddUserIdToInterfaces < ActiveRecord::Migration[5.1]
  def change
  	add_column :interfaces, :user_id, :integer
  end
end

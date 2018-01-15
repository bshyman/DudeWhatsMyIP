class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider, null:false
      t.string :uid, null: false
      t.string :email, null:false
      t.string :first_name
      t.string :last_name
      t.string :picture


      t.timestamps
    end
  end
end

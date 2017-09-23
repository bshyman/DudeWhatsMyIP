class CreateInterfaces < ActiveRecord::Migration[5.1]
  def change
    create_table :interfaces do |t|
      t.string :ip
      t.string :hostname
      t.integer :port
      t.string :ddns
      t.string :notes

      t.timestamps
    end
  end
end

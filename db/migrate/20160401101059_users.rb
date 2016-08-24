class Users < ActiveRecord::Migration
  def change
  	 create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :f_name
      t.string :l_name
      

      t.timestamps null: false
  	end
  end
end


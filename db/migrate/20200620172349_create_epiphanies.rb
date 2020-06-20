class CreateEpiphanies < ActiveRecord::Migration
  def change
    create_table :epiphanies do |t|
      t.string :content
      t.integer :user_id
    end 
  end
end

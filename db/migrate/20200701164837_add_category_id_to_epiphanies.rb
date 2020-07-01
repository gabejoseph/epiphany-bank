class AddCategoryIdToEpiphanies < ActiveRecord::Migration
  def change
    add_column :epiphanies, :category_id, :integer
  end
end

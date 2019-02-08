class RemoveNameFromRaitings < ActiveRecord::Migration[5.2]
  def change
    remove_column :raitings, :name, :text
  end
end

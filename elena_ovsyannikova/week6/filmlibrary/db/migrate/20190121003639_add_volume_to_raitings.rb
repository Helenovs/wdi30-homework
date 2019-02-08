class AddVolumeToRaitings < ActiveRecord::Migration[5.2]
  def change
    add_column :raitings, :volume, :integer
  end
end

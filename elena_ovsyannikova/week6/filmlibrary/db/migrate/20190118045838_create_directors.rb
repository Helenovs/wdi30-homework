class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.text :name
      t.date :dob
      t.text :image
      t.text :nationality

      t.timestamps
    end
  end
end

class CreateRaitings < ActiveRecord::Migration[5.2]
  def change
    create_table :raitings do |t|
      t.text :name
      t.integer :film_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateFilmsLists < ActiveRecord::Migration[5.2]
  def change
    create_table :films_lists do |t|
      t.integer :film_id
      t.integer :list_id
    end
  end
end

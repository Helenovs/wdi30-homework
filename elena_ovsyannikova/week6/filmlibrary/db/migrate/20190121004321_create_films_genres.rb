class CreateFilmsGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :films_genres do |t|
      t.integer :film_id
      t.integer :genre_id
    end
  end
end

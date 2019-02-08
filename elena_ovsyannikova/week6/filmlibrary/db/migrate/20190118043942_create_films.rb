class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.text :title
      t.text :director
      t.date :release_date
      t.text :genre
      t.text :country
      t.integer :runtime
      t.text :image
      t.text :plot

      t.timestamps
    end
  end
end

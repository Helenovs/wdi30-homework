class AddStarsAndReviewToRatings < ActiveRecord::Migration[5.2]
  def change
    rename_table :raitings, :ratings
    add_column :ratings, :stars, :integer
    add_column :ratings, :review, :text
  end
end

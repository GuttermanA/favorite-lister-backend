class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_path
      t.string :overview
      t.datetime :release_date
      t.timestamps
    end
  end
end

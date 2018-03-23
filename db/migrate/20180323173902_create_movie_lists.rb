class CreateMovieLists < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_lists do |t|
      t.integer :list_id
      t.integer :movie_id
      t.integer :position
      t.timestamps
    end
  end
end

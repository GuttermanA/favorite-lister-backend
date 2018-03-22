class CreateListMovieUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :list_movie_users do |t|
      t.integer :user_id
      t.integer :list_id
      t.integer :movie_id
      t.integer :position
      t.timestamps
    end
  end
end

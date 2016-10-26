class AddDetailsToGames < ActiveRecord::Migration
  def change
    add_column :games, :sport, :string
    add_column :games, :level, :string
    add_column :games, :location, :string
    add_column :games, :price, :integer
    add_column :games, :players, :integer
    add_column :games, :daytime, :date
  end
end

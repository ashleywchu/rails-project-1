class AddStartMonthStartYearAndTitleToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :title, :string
    add_column :positions, :start_month, :integer
    add_column :positions, :start_year, :integer
  end
end

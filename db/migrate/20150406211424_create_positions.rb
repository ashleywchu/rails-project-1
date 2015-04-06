class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
    	t.integer :employee_id
    	t.integer :company_id
      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.integer :city_id
    	t.integer :cohort_id
    	t.integer :company_id
    	t.boolean :current_student, default: nil
    	t.boolean :claimed, default: false

      t.timestamps null: false
    end
  end
end

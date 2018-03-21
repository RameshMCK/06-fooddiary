class CreateFoodDiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :food_diaries do |t|
      t.date :date_consumed
      t.string :category
      t.string :name
      t.integer :no_of_servings
      t.integer :cal_per_servings
      t.timestamps
    end
  end
end

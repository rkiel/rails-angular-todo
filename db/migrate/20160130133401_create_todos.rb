class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :description
      t.time :completed_at

      t.timestamps null: false
    end
  end
end

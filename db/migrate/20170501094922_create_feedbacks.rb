class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :age
      t.string :name
      t.string :date
      t.string :file
      t.integer :previous_id

      t.timestamps
    end
  end
end

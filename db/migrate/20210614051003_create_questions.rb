class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.boolean :solved

      t.timestamps
    end
  end
end

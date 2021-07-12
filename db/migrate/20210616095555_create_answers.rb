class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.bigint :user_id
      t.bigint :question_id

      t.timestamps
    end
  end
end

class AddCorrectAnswerToQnas < ActiveRecord::Migration[5.2]
  def up
    add_column :qnas, :correct_answer, :string
  end

  def down
    remove_column :qnas, :correct_answer
  end
end

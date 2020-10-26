class Tags < ActiveRecord::Migration[5.2]
  # A qnas can have many tags.  A quiz can have many tags.
  # A tag can belong to many qnas and/or quizzes.

  # tag = Tag.create(name: 'Pirate Flags')
  # qna = Qna.first
  # TagTarget.create(tag: tag, target: qna)

  def up
    create_table :tags do |t|
      t.string :name, index: true, null: false
      t.timestamps
    end

    create_table :tag_targets do |t|
      t.references :tag
      t.references :target, polymorphic: true,
                            index: {:name => 'tag_target_index'}
    end
  end

  def down
    drop_table :tag_targets
    drop_table :tags
  end
end

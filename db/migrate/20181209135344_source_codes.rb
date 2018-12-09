class SourceCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :source_codes do |t|
      t.string :language
      t.text :source_code
      t.text :highlighted_source_code
      t.timestamps
    end

    add_index :source_codes, :language
  end
end

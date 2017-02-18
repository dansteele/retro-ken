class CreateReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :reactions do |t|
      t.integer     :message_id,       null: false
      t.decimal     :ts,               null: false
      t.string      :reaction,         null: false
      t.boolean     :positive,         null: false
      t.timestamps
    end
  end
end

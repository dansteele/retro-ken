class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer     :retrospective_id, null: false
      t.decimal     :ts,               null: false
      t.string      :message,          null: false
      t.boolean     :positive,         null: false
      t.boolean     :in_summary,       default: false
      t.integer     :reactions_count,  default: 0
      t.timestamps
    end
  end
end

class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer     :retrospective_id, null: false
      t.string      :message,          null: false
      t.boolean     :positive,         null: false
      t.timestamps
    end
  end
end

class CreateRetrospective < ActiveRecord::Migration[5.0]
  def change
    create_table :retrospectives do |t|
      t.boolean     :finished, default: false, null: false
      t.timestamps
    end
  end
end

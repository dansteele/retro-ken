class CreateRetrospective < ActiveRecord::Migration[5.0]
  def change
    create_table :retrospectives do |t|
      t.timestamps
    end
  end
end

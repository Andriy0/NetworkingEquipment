class CreateAdapters < ActiveRecord::Migration[7.0]
  def change
    create_table :adapters do |t|
      t.text :name
      t.belongs_to :vendor, null: false, foreign_key: true
      t.belongs_to :adapter_type, null: false, foreign_key: true
      t.belongs_to :connection_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end

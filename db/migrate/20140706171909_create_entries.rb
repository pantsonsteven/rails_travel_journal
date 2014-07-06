class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.date :date
      t.string :image_url
      t.string :weather
      t.string :location
      t.string :text

      t.timestamps
    end
  end
end

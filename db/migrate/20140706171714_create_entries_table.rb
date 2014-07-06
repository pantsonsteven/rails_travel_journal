class CreateEntriesTable < ActiveRecord::Migration
  def change
    create_table :entries_tables do |t|
      t.string :title
      t.date :date
      t.string :weather
      t.string :location

      t.timestamp
    end
  end
end

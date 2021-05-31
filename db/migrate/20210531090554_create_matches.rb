class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :year
      t.string :league
      t.string :kind
      t.string :date
      t.string :time
      t.integer :home
      t.integer :homescore
      t.integer :awayscore
      t.integer :away
      t.string :stadium
      t.integer :viewers
      t.string :broadcasts

      t.timestamps
    end
  end
end

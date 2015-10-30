class CreateSchooltests < ActiveRecord::Migration
  def change
    create_table :schooltests do |t|
      t.string :schoolName
      t.integer :schoolNumber
      t.integer :schoolDistrict

      t.timestamps null: false
    end
  end
end

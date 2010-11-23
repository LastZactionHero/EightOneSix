class CreateDirectoryCompanies < ActiveRecord::Migration
  def self.up
    create_table :directory_companies do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :maincontact
      t.string :url
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :directory_companies
  end
end

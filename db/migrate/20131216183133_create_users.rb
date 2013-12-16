class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.references :referrer, index: true

      t.timestamps
    end
  end
end

class CreateInstitutions < ActiveRecord::Migration[6.0]
  def change
    create_table :institutions do |t|
      t.string :ipeds_id, null: false, unique: true
      t.string :name
      t.string :alias

      t.timestamps
    end
  end
end

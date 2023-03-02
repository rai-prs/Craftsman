class CreateDiagnoses < ActiveRecord::Migration[6.1]
  def change
    create_table :diagnoses do |t|
      t.string :communication
      t.string :planning
      t.string :dexterous
      t.string :tidy
      t.string :physically
      t.string :muscle
      t.string :intelligence
      t.string :careful
      t.string :pride
      t.string :picky
      t.string :narrow
      t.string :dirt
      t.string :destruction
      t.string :high

      t.timestamps
    end
  end
end

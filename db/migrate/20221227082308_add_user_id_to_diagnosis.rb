class AddUserIdToDiagnosis < ActiveRecord::Migration[6.1]
  def change
    add_column :diagnoses, :user_id, :integer
  end
end

class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

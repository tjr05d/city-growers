class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships, :id => false do |t|
      t.integer :user_id
      t.integer :group_id
    end

    add_index(:memberships, [:user_id, :group_id], :unique => true)
    add_index(:memberships, [:group_id, :user_id], :unique => true)
  end
end

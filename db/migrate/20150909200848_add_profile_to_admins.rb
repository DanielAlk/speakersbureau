class AddProfileToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :profile, :string
  end
end

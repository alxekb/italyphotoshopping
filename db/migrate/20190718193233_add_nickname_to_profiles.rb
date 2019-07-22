class AddNicknameToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :nickname, :string
  end
end

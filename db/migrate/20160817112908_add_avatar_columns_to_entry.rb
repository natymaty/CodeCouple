class AddAvatarColumnsToEntry < ActiveRecord::Migration
  def up
    add_attachment :entries, :avatar
  end

  def down
    remove_attachment :entries, :avatar
  end
end

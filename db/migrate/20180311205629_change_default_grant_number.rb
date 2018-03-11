class ChangeDefaultGrantNumber < ActiveRecord::Migration
  def up
    change_column_default :users, :grants, (ENV['DEFAULT_HEARTS'] || 0)
  end

  def down
    change_column_default :users, :grants, 0
  end
end

class Securitykey < ActiveRecord::Migration
  def change
    add_column :posts, :security_key, :integer
  end
end

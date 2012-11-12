class UpdateUserTable < ActiveRecord::Migration
  def change
     add_column(:users, :address, :string)
     add_column(:users, :phone, :string)
     add_column(:users, :dob, :date)
     add_column(:users, :gender, :string)
     add_column(:users, :location, :string)
     add_column(:users, :website, :string)
  end

end

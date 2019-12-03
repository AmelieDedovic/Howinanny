class AddPhotoToNannies < ActiveRecord::Migration[5.2]
  def change
    add_column :nannies, :photo, :string
  end
end

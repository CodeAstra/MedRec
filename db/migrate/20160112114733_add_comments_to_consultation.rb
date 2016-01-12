class AddCommentsToConsultation < ActiveRecord::Migration
  def change
    add_column :consultations, :comments, :string
  end
end

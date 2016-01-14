class AddFormattedCodeToItems < ActiveRecord::Migration
  def change
  	add_column :items, :formatted_code, :string
  end
end

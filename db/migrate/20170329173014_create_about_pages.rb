class CreateAboutPages < ActiveRecord::Migration[5.0]
  def change
    create_table :about_pages do |t|
      t.string :title
      t.string :contents

      t.timestamps
    end
  end
end

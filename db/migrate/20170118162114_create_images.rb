class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|

      t.integer :image_id
      t.string  :name
      t.string  :image_url
      t.string  :original_url
      t.float   :rating
      t.timestamps
    end
  end
end

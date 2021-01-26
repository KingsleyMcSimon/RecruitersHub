class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.text :recruit

      t.timestamps
    end
  end
end

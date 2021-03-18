class CreateAttendences < ActiveRecord::Migration[6.1]
  def change
    create_table :attendences do |t|

      t.timestamps
    end
  end
end

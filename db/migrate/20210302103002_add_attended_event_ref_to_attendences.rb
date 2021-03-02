class AddAttendedEventRefToAttendences < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendences, :attended_event, foreign_key: { to_table: :events }
  end
end

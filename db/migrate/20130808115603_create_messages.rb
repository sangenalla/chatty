class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.string :sent_by
      t.string :sent_to
      t.boolean :is_read, :default => false

      t.timestamps
    end
  end
end

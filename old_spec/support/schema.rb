ActiveRecord::Schema.define do
  self.verbose = false

  create_table :addresses, :force => true do |t|
    t.string :street
    t.string :city
    t.string :state
    t.string :zip
    t.timestamps
  end
end

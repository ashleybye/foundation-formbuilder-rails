class Test < ActiveRecord::Base
  validates :text_field, :text_area, :password_field, presence: true, length: { minimum: 5 }
end
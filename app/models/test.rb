class Test < ActiveRecord::Base
  validates :text_field, presence: true
end
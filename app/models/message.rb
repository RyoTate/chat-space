class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  accepts_nested_attributes_for :users, allow_destroy: true
end

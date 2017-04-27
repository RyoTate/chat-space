class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  scope :current_group, -> (group){ where(group_id: group) }
end

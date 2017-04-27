class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  scope :current_group, -> (group){ where(group_id: group) }
  scope :last_created, -> {order(created_at: :DESC)}
end

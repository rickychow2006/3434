class Message < ApplicationRecord
  validates :user_id, :channel_id, presence: true

  has_one :thread,
      foreign_key: :parent_id,
      class_name: :Message

  belongs_to :user,
      foreign_key: :user_id,
      class_name: :User

  belongs_to :channel,
      foreign_key: :channel_id,
      class_name: :Channel

  belongs_to :parent_message,
      foreign_key: :parent_id,
      class_name: :Message,
      optional: true
end

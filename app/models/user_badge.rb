# frozen_string_literal: true

# == Schema Information
#
# Table name: user_badges
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  badge_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_badges_on_badge_id              (badge_id)
#  index_user_badges_on_user_id               (user_id)
#  index_user_badges_on_user_id_and_badge_id  (user_id,badge_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (badge_id => badges.id)
#  fk_rails_...  (user_id => users.id)
#
class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  validates :user, uniqueness: { scope: :badge }
end

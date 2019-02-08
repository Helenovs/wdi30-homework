# == Schema Information
#
# Table name: ratings
#
#  id         :bigint(8)        not null, primary key
#  film_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  volume     :integer
#  stars      :integer
#  review     :text
#

class Rating < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :film, :optional => true
end

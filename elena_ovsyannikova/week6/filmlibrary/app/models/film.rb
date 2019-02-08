# == Schema Information
#
# Table name: films
#
#  id           :bigint(8)        not null, primary key
#  title        :text
#  director     :text
#  release_date :date
#  genre        :text
#  country      :text
#  runtime      :integer
#  image        :text
#  plot         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  director_id  :integer
#  rating       :float
#

class Film < ApplicationRecord
  belongs_to :director, :optional => true
  has_many :ratings
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :lists

end

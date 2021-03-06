# == Schema Information
#
# Table name: directors
#
#  id          :bigint(8)        not null, primary key
#  name        :text
#  dob         :date
#  image       :text
#  nationality :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Director < ApplicationRecord
  has_many :films
  has_many :genres, :through => :films
end

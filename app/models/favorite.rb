class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :internship_id

  belongs_to :user
  belongs_to :internship
end

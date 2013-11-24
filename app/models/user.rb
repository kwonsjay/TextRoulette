class User < ActiveRecord::Base
  attr_accessible :phone, :gender, :zip_code, :birthday, :nsfw

  has_one :conversation
end

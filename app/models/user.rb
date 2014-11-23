# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  username              :string(255)
#  email                 :string(255)
#  contact               :string(255)
#  company               :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  password              :string(255)
#  password_confirmation :string(255)
#

class User < ActiveRecord::Base
end

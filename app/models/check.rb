class Check < ActiveRecord::Base
	validates :title, presence: true
end

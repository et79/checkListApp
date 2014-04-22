class Project < ActiveRecord::Base
	has_many :check_results
	validates :title, presence: true
end

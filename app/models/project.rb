class Project < ActiveRecord::Base
	belongs_to :user
	
	has_many :check_results

	accepts_nested_attributes_for :check_results

	validates :title, presence: true
end

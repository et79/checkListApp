class Project < ActiveRecord::Base
	acts_as_taggable # Alias for acts_as_taggable_on :tags
	
	belongs_to :user
	
	has_many :check_results

	accepts_nested_attributes_for :check_results

	validates :title, presence: true
end

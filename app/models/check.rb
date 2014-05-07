class Check < ActiveRecord::Base
	acts_as_taggable # Alias for acts_as_taggable_on :tags

	# 入力値チェック
	# title のみ実施
	# contents は、補足的な場合もあるので、なくてもOK
	belongs_to :user
	validates :title, presence: true
end

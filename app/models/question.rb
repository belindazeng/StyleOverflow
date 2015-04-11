class Question < ActiveRecord::Base

	belongs_to :user

	# adding a commentability feature here
	acts_as_commentable

end

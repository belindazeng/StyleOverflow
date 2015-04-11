class QuestionsController < ApplicationController
	
	before_action :authenticate_user!, only: :index

	def new
		@question = Question.new
		@testing = Question.all
	end

	def create 
		@question = Question.new(question_params)
		@testing = Question.all
		@question.user = current_user
		if @question.save
			flash[:success] = "You have created a tweet"
			redirect_to new_question_path
		else 
			# redirect_to new_question_path
			# YOU CAN'T SAY REDIRECT HERE BECAUSE WE NEED TO KEEP TRACK OF THE @TWEET EVEN IT'S LONG SO THAT THE USER 
			# DOESN'T HAVE TO TYPE EVERYTHING ALL OVER AGAIN
			render 'new'
		end
	end

	def question_params
		params.require(:question).permit(:content)
	end

	def index
		@questions = Question.all
	end


end


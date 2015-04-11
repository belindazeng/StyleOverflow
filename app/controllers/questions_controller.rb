class QuestionsController < ApplicationController
	
	def new
		@question = Question.new
		@testing = Question.all
	end

	def create 
		@question = Question.new(question_params)
		@testing = Question.all
		if @question.save
			flash[:success] = "You have created a tweet"
			redirect_to new_question_path
		end
	end

	def question_params
		params.require(:question).permit(:content)
	end

	def index
		@questions = Question.all
	end


end


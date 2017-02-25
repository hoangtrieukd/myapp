class UsersController < ApplicationController
	def create
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			flash[:success]="Article was susscesfully create"
			redirect_to_article_parh(@article)
		else
		render 'new'
	end
end

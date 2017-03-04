class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def index
		@users = User.paginate(page: params[:page], per_page: 5)
		
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to the alpha blog #{@user.username}"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "congratulation#{@user.username}"
			redirect_to articles_path
		else
			render 'edit'
		end
		
	end

	def show
		@user = User.find(params[:id])	
		@user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice]="deleted"
		redirect_to users_path
	end

	private
	
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end

  class ArticlesController < ApplicationController

    #Loggedin user only can access these pages such as index show edit update and destroy
      before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]


   http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
    @articles = Article.all
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
  	  @article = Article.new

  end

  def edit
  	  @article = Article.find(params[:id])
  end

   http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
	
  def create
    @article = Article.new(article_params)
    # if condition
    #   @current_user.loggedin?
      
    if @article.save
  	 redirect_to @article
    else
  	 render 'new'
  	end

  end


 
 def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  if @article.comments.length > 0
    #show message
    #@comment.destroy
    flash[:alert] = "First you should delete the comment!"
      # <% if flash[:alert] %>
      #         <div class="alert"><%= flash[:alert] %></div>
      # <% end %>


  else 
    # method: :delete,

    # data: { confirm: 'Are you sure?' } 
    @article.destroy
  end

  redirect_to articles_path

end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

 
end


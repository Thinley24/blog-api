class ArticlesController < ApplicationController

  # providing authentication
  # http_basic_authenticate_with name: "tj", password: "tjtj", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) # using params Hash to capture id
  end

  def new #instantiates the new article, but does not save it
    @article = Article.new
  end

  def create #instantiates a new article with values for the title and body then saves it
    @article = Article.new(article_params)

    if @article.save # if saved successfully the action redirects the browser to the article's page
      redirect_to @article # new request made
    else #else the action redisplays the form by rendering ../new.html.erb with status code "422 Unprocessable Entity"
      render :new, status: :unprocessable_entity #renders the specified view for current request
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other # redirects the browser to the root path (because, that is our main access point) with status code "303 See Other"
  end

  # using "strong parameters" to filter params to specify what values are allowed in the Hash in order to avoid malicious activity
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end

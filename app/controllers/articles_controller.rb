class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:show,:index]
    before_action :set_article, except: [:index,:new,:create]
   
    def index
     @articles = Article.all
    end
    def show
        @article.update_visits_count
        @comment = Comment.new
    end
    def new
      @article = Article.new
    end
    def edit
   
    end
    def create
        @article = current_user.articles.new(article_params)
        if @article.save
            flash[:success] = "Articulo publicado exitosamente"
            
            redirect_to @article
          else
            flash[:error] = "Algo salio mal, el post no fue publicado"
            render 'new'
          end
    end
    def destroy
        
        if @article.destroy #elimina el objeto de la base de datos
            flash[:success] = 'Article was successfully deleted.'
            redirect_to articles_url
       else
            flash[:error] = 'Something went wrong'
            redirect_to articles_url
       end
    end
    def update
       
        @article = Article.find(params[:id])
        if @article.update_attributes(article_params)
          flash[:success] = "Article was successfully updated"
          redirect_to @article
        else
          flash[:error] = "Something went wrong"
          render :edit
        end
    end

    def myarticles
        #ordenando desde el ultimo al primero
       @articles = current_user.articles.order("created_at DESC")
  end

    private

    def set_article
        @article = Article.find(params[:id])
   end
   

    def article_params
        params.require(:article).permit(:title,:body)
    end

end

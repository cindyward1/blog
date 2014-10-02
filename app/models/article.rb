class Article < ActiveRecord::Base

private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end

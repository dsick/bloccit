class PostsController < ApplicationController
  def index
    @posts = Post.all
    spam_check
  end

  def show
  end

  def new
  end

  def edit
  end

  def spam_check
    @posts.each_with_index do |item,index|
      if (index % 5) == 0
        item.title = "SPAM"
      end
    end
  end
end

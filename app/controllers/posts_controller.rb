class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def self.spam_check
    post.each do |item|
      if item.id % 5 == 1
        item.title = 'SPAM'
      end
    end
  end
end

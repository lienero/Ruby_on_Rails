class HomeController < ApplicationController
    def index
        @post = Post.all
    end

    def write
        
    end

    def create
        post = Post.new
        post.title = params[:title]
        post.content = params[:content]
        post.save        

        redirect_to '/index'
    end
end

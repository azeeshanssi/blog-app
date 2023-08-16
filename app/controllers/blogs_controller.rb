class BlogsController < ApplicationController
    before_action:set_user
    before_action :blog_params, only: [:create]
    def index
        @blogs=Blog.all
    end
    def new
        @blog=@user.blogs.new
    end
    def create
        @blog=@user.blogs.new(blog_params)
        if @blog.save
            redirect_to root_path, notice:('User was created succesfully')
        end


    end
    private
    def set_user
        @user = User.find(params[:user_id])
    end

    def blog_params
        params.require(:blog).permit(:title,:description)

    end
end

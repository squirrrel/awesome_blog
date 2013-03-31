class MyblogController < ApplicationController

  layout 'application'

  def index
    new
    render('new')
  end

  def signin
    #render('signin')
    @register = Mes.new(params[:register])
  end

  def new
    @register = Mes.new
    #   @register.username ||= "Username"
    #   @register.password ||= "Password"
  end


  def create
    @register = Mes.new(params[:register])

    creds_test = Mes.authenticate(params[:register], params[:commit])
    if creds_test == true
      redirect_to(:action => 'blog')
    else
      flash[:notice] = creds_test
      params[:commit] == 'Sign in' ? (render('signin')) : (render('new'))
    end

  end

  def blog

    @user = Mes.find_by_username(Mes.current_user)

    @basic_stuff = {}

    @user.blogs.all.each do |bl|

      @basic_stuff[bl.blog] = Posts.find_all_by_blog_id(bl.id).map { |pst| pst.title }

    end


    #todo: create action in order to be able to read posts(redirect them to a different page/browser tab/load it on the right in the same window?)
    #todo: the 'Add' button right below the blogs list with a drop-down. After choosing an option, a corresponding form
    #todo: will be shown to basically create either a blog or add a post to the existent one
    #todo: wanna a script that will expand/collapse the blogs to hide/show their related posts
    #todo: upload a pic functionality
    #todo: show other guys from the sys


    render('blog')
  end

end

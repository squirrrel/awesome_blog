class MyblogController < ApplicationController

  layout 'application'

  def index
    new
    render('new')
  end

  def signin
    render('signin')
  end

  def new
    @register = Mes.new
    @register.username ||= "Username"
    @register.password ||= "Password"
  end


  def create
    @register = Mes.new(params[:register])
    creds_test = Mes.authenticate(params[:register], params[:commit])
    if creds_test == true
      redirect_to(:action => 'blog')
    else
      flash[:notice] = creds_test
      render('new')
    end

  end

  def blog
    render('blog')
  end

end

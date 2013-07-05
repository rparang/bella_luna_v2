class MenusController < ApplicationController
	respond_to :json

  def index
    @menus = Menu.order("position")
    respond_with @menus.to_json(:include => { :category => { :only => :name }}) #.order("position")
    #respond_to do |format|
    #  format.json do
    #    render :json => @menus.to_json(:include => [:category])
    #  end
    #end
  end

  def show
    @menu = Menu.find(params[:id])
    respond_with @menu.to_json(:include => { :category => { :only => :name }})
  end

  def create
    respond_with Menu.create(params[:menu])
  end

  def update
    respond_with Menu.update(params[:id], params[:menu])
  end

  def destroy
    respond_with Menu.destroy(params[:id])
  end

  def sort
    params[:menu].each_with_index do |id, index|
      Menu.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

end

class MenusController < ApplicationController
	respond_to :json

  def index
    @menus = Menu.order("position")
    respond_with @menus.to_json(:include => { :category => { :only => :name }})
  end

  def show
    @menu = Menu.find(params[:id])
    respond_with @menu.to_json(:include => { :category => { :only => :name }})
  end

  def create
    @category = Category.find_by_name(params[:category_name])
    respond_with Menu.create(params[:menu].merge(:category_id => @category.id))
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

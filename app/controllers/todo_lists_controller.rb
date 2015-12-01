class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  # GET /todo_lists
  def index
    @todo_lists = TodoList.all
  end

  # GET /todo_lists/1
  def show
  end

  # GET /todo_lists/new
  def new
   @todo_list = TodoList.new
  end

  # GET /todo_lists/1/edit
  def edit
  end

  # POST /todo_lists
  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_lists = TodoList.all
    @todo_list.save
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        flash.now[:notice] =  'Todo list was successfully updated.'
        format.js {}
      else
        flash.now[:notice] = "Todo list could not be update" 
        format.js {}
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Todo list was successfully destroyed.' }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end

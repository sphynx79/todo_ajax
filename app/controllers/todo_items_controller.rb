class TodoItemsController < ApplicationController
   before_action :set_todo_list
   before_action :set_todo_item, except: [:create]

   def create
      @todo_item = @todo_list.todo_items.new(params[:todo_item].permit(:content))
      if @todo_item.save
          flash.now[:notice] =  "New Todo item created"
      else
         flash.now[:notice] = "New Todo item could not be create"
      end 
   end

   def destroy
      @todo_item = @todo_list.todo_items.find(params[:id])
      if @todo_item.destroy
         flash.now[:notice] = "Todo List item was deleted."
      else
         flash.now[:notice] = "Todo List item could not be deleted."
      end
      respond_to do |format|
         format.html { redirect_to @todo_list}
         format.js {}
      end
   end

   def complete
      if @todo_item.completed?
         @todo_item.update_attribute(:completed_at, nil)
         respond_to do |format|
            flash.now[:notice] =  "Todo item incompleted" 
            format.html { redirect_to @todo_list, notice: "Todo item incompleted" }
            format.js { }
         end
      else
         @todo_item.update_attribute(:completed_at, Time.now)
         respond_to do |format|
            flash.now[:notice] =  "Todo item completed" 
            format.html { redirect_to @todo_list, notice: "Todo item completed" }
            format.js { }
         end
      end
   end




   private

   def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
   end

   def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
   end



   def todo_item_params
      params[:todo_item].permit(:content)
   end


end

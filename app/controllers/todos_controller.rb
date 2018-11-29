class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    redirect_to todos_path if @todo.save
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    redirect_to todos_path if @todo.update(todo_params)
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy(todo_params)
      redirect_to todos_path
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end

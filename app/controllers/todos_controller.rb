class TodosController < ApplicationController

  def index
    render json: Todo.all
  end

  def create
    todo = Todo.create(description: params[:description])
    render json: todo;
  end

  def destroy
    Todo.find(params[:id]).destroy
    render json: {}, status: :no_content
  end
end

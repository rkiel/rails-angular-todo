class API::TodosController < ApplicationController

  before_filter :authorize

  def index
    render json: Todo.where(uuid: current_token.uuid)
  end

  def create
    todo = Todo.create(description: params[:description], uuid: current_token.uuid)
    render json: todo;
  end

  def destroy
    Todo.find(params[:id]).destroy
    render json: {}, status: :no_content
  end

end

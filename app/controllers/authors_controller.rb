class AuthorsController < ApplicationController
  def show
    # binding.pry
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
    # binding.pry
  end

  def create
    # binding.pry
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author)
    else 
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end

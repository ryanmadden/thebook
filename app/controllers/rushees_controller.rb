class RusheesController < ApplicationController
  before_action :signed_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_rushee, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @rushees = Rushee.all
  end

  def show
  end

  def new
    @rushee = current_user.rushees.build
  end

  def edit
  end


  def create
    @rushee = current_user.rushees.build(rushee_params)
    if @rushee.save
      redirect_to @rushee, notice: 'Rushee was successfully added.'
    else
      render action: 'new'
    end
  end

  def update
    if @rushee.update(rushee_params)
      redirect_to @rushee, notice: 'Rushee was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @rushee.destroy
    redirect_to rushees_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rushee
      @rushee = Rushee.find(params[:id])
    end

    def signed_in
      redirect_to root_path, notice: "Please log in to view page" if not current_user
    end

    def correct_user
      @rushee = current_user.rushees.find_by(id: params[:id])
      redirect_to rushees_path, notice: "Not authorized to edit this post" if @rushee.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rushee_params
      params.require(:rushee).permit(:name, :age, :bio)
    end
end


# def correct_user
#      @rushee = current_user.rushees.find_by(id: params[:id])
#      redirect_to rushees_path, notice: "Not authorized to edit this post" if @rushee.nil?
#    end

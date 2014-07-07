class RusheesController < ApplicationController
  before_action :set_rushee, only: [:show, :edit, :update, :destroy]

  def index
    @rushees = Rushee.all
  end

  def show
  end

  def new
    @rushee = Rushee.new
  end

  def edit
  end


   def create
    @rushee = Rushee.new(rushee_params)
    if @rushee.save
      redirect_to @rushee, notice: 'Rushee was successfully added.'
    else
      render action: 'new'
    end
  end

  def create
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def rushee_params
      params.require(:rushee).permit(:name, :age, :bio)
    end
end

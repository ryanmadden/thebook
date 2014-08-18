class RusheesController < ApplicationController
  before_action :signed_in
  before_action :set_rushee, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @rushees = Rushee.all.shuffle
  end

  def recent
    @rushees = Rushee.all.order("created_at DESC")
  end

  def top
    @rushees = Rushee.all.order(:cached_votes_total => :desc)
  end

  def views
    @rushees = Rushee.all.order(:impressions_count => :desc)
  end

  def show
    @rushee = Rushee.find(params[:id])
    impressionist(@rushee)
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
    redirect_to rushees_url, notice: 'Rushee was successfully deleted'
  end

  def vote
    @rushee = Rushee.find(params[:id])
    @rushee.liked_by current_user
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def unvote
    @rushee = Rushee.find(params[:id])
    @rushee.unliked_by current_user
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def comments_count
    comments.count
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
      if current_user.id == 1 or 2
      else
        @rushee = current_user.rushees.find_by(id: params[:id])
        redirect_to rushees_path, notice: "Not authorized to edit this post" if @rushee.nil?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rushee_params
      params.require(:rushee).permit(:name, :age, :bio, :image)
    end
end


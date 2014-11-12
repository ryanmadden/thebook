class RusheesController < ApplicationController
  before_action :signed_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin, only: [:offered, :unoffered, :dropped, :undropped, :tabled, :untabled, :rejected, :unrejected]

  def stats
    @rushees = Rushee.all.shuffle
    @rushees_likes = Rushee.all.order(:cached_votes_total => :desc)
    @rushees_comments = Rushee.all.order(:comments_count => :desc)
  end

  def index
    @rushees = Rushee.all.shuffle
  end

  def recent
    @rushees = Rushee.all.order("created_at DESC")
    @comments = Comment.all.order("created_at DESC")
  end

  def top
    @rushees = Rushee.all.order(:cached_votes_total => :desc)
  end

  def views
    @rushees = Rushee.all.order(:impressions_count => :desc)
  end

  def comments
    @rushees = Rushee.all.order(:comments_count => :desc)
  end

  def show
    @rushee = Rushee.find(params[:id])
    impressionist(@rushee)
  end

  def new
    @rushee = current_user.rushees.build
    flash[:notice] = "Rushee successfully added"
  end

  def edit
     @rushee = Rushee.find(params[:id])
  end

  def offered
    @rushee = Rushee.find(params[:id])
    @rushee.bid_offered = true
    @rushee.save
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def unoffered
    @rushee = Rushee.find(params[:id])
    @rushee.bid_offered = false
    @rushee.bid_dropped = false
    @rushee.bid_tabled = false
    @rushee.bid_rejected = false
    @rushee.save
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def dropped
    @rushee = Rushee.find(params[:id])
    @rushee.bid_dropped = true
    @rushee.bid_tabled = false
    @rushee.bid_rejected = false
    @rushee.save
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def undropped
    @rushee = Rushee.find(params[:id])
    @rushee.bid_dropped = false
    @rushee.bid_tabled = false
    @rushee.bid_rejected = false
    @rushee.save
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def tabled
    @rushee = Rushee.find(params[:id])
    @rushee.bid_dropped = false
    @rushee.bid_tabled = true
    @rushee.bid_rejected = false
    @rushee.save
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def untabled
    @rushee = Rushee.find(params[:id])
    @rushee.bid_dropped = false
    @rushee.bid_tabled = false
    @rushee.bid_rejected = false
    @rushee.save
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def rejected
    @rushee = Rushee.find(params[:id])
    @rushee.bid_dropped = false
    @rushee.bid_tabled = false
    @rushee.bid_rejected = true
    @rushee.save
    respond_to do |format|
      format.html {redirect_to :back }
    end
  end

  def unrejected
    @rushee = Rushee.find(params[:id])
    @rushee.bid_dropped = false
    @rushee.bid_tabled = false
    @rushee.bid_rejected = false
    @rushee.save
    respond_to do |format|
      format.html {redirect_to :back }
    end
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
    @rushee = Rushee.find(params[:id])
    if @rushee.update(rushee_params)
      redirect_to @rushee, notice: 'Rushee was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @rushee = Rushee.find(params[:id])
    @rushee.destroy
    redirect_to rushees_url, notice: 'Rushee was successfully deleted'
  end

  def vote
    @rushee = Rushee.find(params[:id])
    @rushee.liked_by current_user
    respond_to do |format|
      format.html {redirect_to :back }
      format.json { render json: { count: @rushee.votes_for.size } }
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

    def signed_in
      redirect_to root_path, notice: "Please log in to view page" unless current_user
    end

    def correct_user
      if current_user.id <= 3
      else
        @rushee = current_user.rushees.find_by(id: params[:id])
        redirect_to rushees_path, notice: "Not authorized to edit this post" if @rushee.nil?
      end
    end

    def admin
      if current_user.id <= 3
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rushee_params
      params.require(:rushee).permit(:name, :age, :bio, :image, :hometown, :major, :campus_involvement, :fb, :legacy)
    end
end


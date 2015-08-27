class EventTeamUsersController < ApplicationController
  before_action :set_event_team_user, only: [:show, :edit, :update, :destroy]


  # GET /event_team_users
  # GET /event_team_users.json
  def index
    @event_team_users = EventTeamUser.all
  end

  # GET /event_team_users/1
  # GET /event_team_users/1.json
  def show
  end

  # GET /event_team_users/new
  def new
    @event_team_user = EventTeamUser.new
  end

  # GET /event_team_users/1/edit
  def edit
  end

  # POST /event_team_users
  # POST /event_team_users.json
  def create
    @event_team_user = EventTeamUser.new(event_team_user_params)

    respond_to do |format|
      if @event_team_user.save
        @event_team_user.uid = @event_team_user.name.parameterize+'-'+@event_team_user.id.to_s
        @event_team_user.save
        format.html { redirect_to @event_team_user, notice: 'EventTeamUser was successfully created.' }
        format.json { render :show, status: :created, location: @event_team_user }
      else
        format.html { render :new }
        format.json { render json: @event_team_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_team_users/1
  # PATCH/PUT /event_team_users/1.json
  def update
    respond_to do |format|
      if @event_team_user.update(event_team_user_params)
        format.html { redirect_to @event_team_user, notice: 'EventTeamUser was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_team_user }
      else
        format.html { render :edit }
        format.json { render json: @event_team_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_team_users/1
  # DELETE /event_team_users/1.json
  def destroy
    @event_team_user.destroy
    respond_to do |format|
      format.html { redirect_to event_team_users_url, notice: 'EventTeamUser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_team_user
      @event_team_user = EventTeamUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_team_user_params
      params.require(:event_team_user).permit(:name, :start_at, :end_at, :max_teams, :max_team_members, :min_team_members, :owner_id, :address, :address2, :city, :state, :zip, :country, :phone, :loc_note, :website, :latitude, :longitude)
    end
end

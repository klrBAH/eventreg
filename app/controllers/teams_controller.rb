class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :join_team]
  before_action :set_event_team_user, only: [:leave_team]
  respond_to :html
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  def join_team
    @event_team_user = @team.event.event_team_users.find_or_initialize_by(user: current_user)
    @event_team_user.event = @team.event
    @event_team_user.team = @team

      if @team.users.count < @team.event.max_team_members && @event_team_user.save
        redirect_to(event_path(event))
        # format.html { render :show }
        # format.json { render :show, status: :created, location: @team }
      else
        redirect_to(event_path(event), :notice => 'Sorry, this team is full.')
        # format.json { render json: @team.errors, status: :unprocessable_entity }
      end

  end


  def leave_team
    # @event_team_user.team_id = 0
    team = @event_team_user.team
      if @event_team_user.update(team_id: -1)
        redirect_to(event_path(@event_team_user.event))
        # format.html { render :show }
        # format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end

  end



  # GET /teams/new
  def new
    @team = event.teams.new
    respond_with [event, @team]
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = event.teams.new(team_params)
    @team.owner = current_user

    respond_to do |format|
      if @team.save
        @team.uid = @team.name.parameterize+'-'+@team.id.to_s
        @team.save
        format.html {redirect_to(event_team_path(event,@team), :notice => 'The new team was created')}
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def event
    @event ||= Event.find(params[:event_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def set_event_team_user
      @event_team_user = EventTeamUser.find_by event_id: params[:event_id], team_id: params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :event_id, :owner_id, :user_ids, user_ids: [], teams_users_attributes: [ :user_id, :team_id ])
    end
end

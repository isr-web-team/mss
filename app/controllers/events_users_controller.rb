class EventsUsersController < ApplicationController
  before_action :set_events_user, only: [:show, :edit, :update, :destroy]


  def attend
  end

  # GET /events_users
  # GET /events_users.json
  def index
    @events_users = EventsUser.all
  end

  # GET /events_users/1
  # GET /events_users/1.json
  def show
  end

  # GET /events_users/new
  def new
    @events_user = EventsUser.new
    @event = Event.find(params[:event_id])
    @users = User.all
  end

  # GET /events_users/1/edit
  def edit
  end

  # POST /events_users
  # POST /events_users.json
  def create
    @events_user = EventsUser.new(events_user_params)

    respond_to do |format|
      if @events_user.save
        format.html { redirect_to event_path(params[:event_id]), notice: 'Events user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @events_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events_users/1
  # PATCH/PUT /events_users/1.json
  def update
    respond_to do |format|
      if @events_user.update(events_user_params)
        format.html { redirect_to @events_user, notice: 'Events user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @events_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events_users/1
  # DELETE /events_users/1.json
  def destroy
    @events_user.destroy
    respond_to do |format|
      format.html { redirect_to events_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_events_user
      @events_user = EventsUser.find(params[:id])
      debugger
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def events_user_params
      params[:events_user] = params.require(:events_user).permit(:event_id, :user_id, :attend_flg, :comment)
      # TODO viewでhiddenで持たせる方法から、コントローラで渡す方法に変える
      #params[:events_user][:event_id] = params[:event_id]
    end

    def set_event
      @event = Event.find(param[:id])
    end
end

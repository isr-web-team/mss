class EventsUsersController < ApplicationController
  before_action :set_event_users_ids, :set_events_user, only: [:new, :show, :edit, :update, :destroy]

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
    if @event_users_ids.blank?
      @users = User.all
    else
      @users = User.where(
        "id NOT IN(?)", @event_users_ids
      )
    end

    # フォームのパス用
    @path_event = @event
  end

  # GET /events_users/1/edit
  def edit
    @users = User.where(:id => @events_user.user_id)
    @event = @events_user.event

    # edit時はフォームに指定する@eventはnilにする為、
    # フォームのパス用@eventは設定しない
  end

  # POST /events_users
  # POST /events_users.json
  def create
    user = EventsUser.find_by(user_id: events_user_params[:user_id], event_id: events_user_params[:event_id])

    respond_to do |format|
      if user
        format.html {
          redirect_to new_event_events_user_path,
                      alert: I18n.t("helpers.notices.already_registered")
        }
#        format.json { render action: 'new', status: :created }
      else

        @events_user = EventsUser.new(events_user_params)

        if @events_user.save
          format.html { redirect_to event_path(params[:event_id]),
                                    notice: I18n.t("helpers.notices.success")
          }
#          format.json { render action: 'show', status: :created, location: @event }
        else
          format.html { 
            redirect_to new_event_events_user_path,
                        alert: I18n.t("helpers.notices.failed")
          }
#          format.json { render json: @events_user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /events_users/1
  # PATCH/PUT /events_users/1.json
  def update
    @event = @events_user.event
    respond_to do |format|
      if @events_user.update(events_user_params)
        format.html { redirect_to @event, notice: 'Events user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
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
    def set_event_users_ids
      @event_users_ids = 
        EventsUser.select(:user_id)
                  .where(:event_id => params[:event_id])
                  .uniq.pluck(:user_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def events_user_params
      params[:events_user] = params.require(:events_user).permit(:event_id, :user_id, :attend_flg, :comment)
      # TODO viewでhiddenで持たせる方法から、コントローラで渡す方法に変える
      #params[:events_user][:event_id] = params[:event_id]
    end

    def set_events_user
      if params[:id].present?
        @events_user = EventsUser.find(params[:id])
      end
    end
end

require 'net/https'
require 'net/http'
require 'uri'
require 'json'
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events?channel_id={id}&word={}
  # GET /events.json
  #author naya
  def index
    events = Hash.new
    if params[:channel_id] == nil
      res = Event.all.order(:host_date)
    else
      res = Event.where(channel_id: params[:channel_id])
    end
    search_word = params[:word]
    res = res.where('name LIKE ?', "%#{search_word}%").order(:host_date)
    events["events"] = res.to_a
    render json: events
  end

  #イベント詳細を表示するAPI(getEventInfo(eventID))
  # GET /events/1
  # GET /events/1.json
  #author naya
  def show
    render json: @event
  end

  #ログイン中のユーザーがイベントに参加するAPI
  #POST events/:id/participate/:user_id
  #author naya
  def participate
    #ユーザー認証をdeviseで実装した場合current_userヘルパーでログイン中のユーザーを取得できる
    #user = current_user
    #ユーザー認証をつけない場合は受け取ったidのユーザーを登録
    user = User.find(params[:user_id])
    participant = Participation.new(user_id: params[:user_id], event_id: params[:id])
    if participant.save
      render status: :ok, json: { status: :ok }
    else
      render status: :bad_request, json: { status: :bad_request }
    end
  end

  #イベント参加をキャンセルするAPI
  #delete events/:id/cancel/:user_id
  #author naya
  def cancel
    participant = Participation.find_by(user_id: params[:user_id], event_id: params[:id])
    if participant != nil
      participant.destroy
      render status: :ok, json: { status: :ok }
    else
      render status: :no_content, json: { status: :no_content }
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # 100urls/24hours can be generated
  def access
    uri = URI.parse(MEETING_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path)
    req["Authorization"] = "Bearer #{JWT}"
    req["Content-Type"] = "application/json"
      req.body = {
          "type":1,
      }.to_json
    res = http.request(req)
    result = JSON.parse(res.body)
    return result["join_url"]
  end

  # POST /events
  # POST /events.json
  def create
    zoom_url = access
    params[:event][:zoom_url] = zoom_url
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.json { render :show, status: :created, location: @event }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:channel_id, :name, :abstract, :zoom_url, :host_date, :from_date, :to_date, :is_delete, :host_user_id)
    end
end

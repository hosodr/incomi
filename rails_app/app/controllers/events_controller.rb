require 'net/https'
require 'net/http'
require 'uri'
require 'json'
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events?channelid={id}
  # GET /events.json
  def index
    events = Event.where(channel_id: params[:channelid])
    render json: events
  end

  #イベント詳細を表示するAPI(getEventInfo(eventID))
  # GET /events/1
  # GET /events/1.json
  def show
    event = Event.find(params[:id])
    render json: event
  end

  #ログイン中のユーザーがイベントに参加するAPI
  #ユーザー認証実装後にちゃんと実装
  # POST /events/:id/participate
  def participate
    #ユーザー認証をdeviseで実装した場合current_userヘルパーでログイン中のユーザーを取得できる
    user = current_user
    participant = Participation.new(user_id: user.id, event_id: :id)
    if participant.saved
      render status: 200, json: { status: 200 }
    else
      render status: 400, json: { status: 400 }
    end
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
    api_key = "hK6x9GGqQoqb07k0CJY3gw"
    secret = "qv6NnyFfACjpziVCuXP61ETZX5OfSxeGxl1B"
    user_id = "zZIC4Ln0TZ2lRdIpwp8szA"
    jwt = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6ImhLNng5R0dxUW9xYjA3azBDSlkzZ3ciLCJleHAiOjE2MDEwMjU2MTAsImlhdCI6MTYwMDQyMDgxM30.j8RrdYOdJpbkR-8GNvikOFWsSYqF2S3zF3eyFWCXPD0"
    meeting_url = "https://api.zoom.us/v2/users/#{user_id}/meetings"
    uri = URI.parse(meeting_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(uri.path)
    req["Authorization"] = "Bearer #{jwt}"
    # Bearer = "Bearer #{jwt}"
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

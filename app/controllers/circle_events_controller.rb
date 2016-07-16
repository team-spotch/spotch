class CircleEventsController < ApplicationController
  before_action :set_circle_event, only: [:show, :edit, :update, :destroy]

  # GET /circle_events
  # GET /circle_events.json
  def index
    @circle_events = CircleEvent.all
  end

  # GET /circle_events/1
  # GET /circle_events/1.json
  def show
  end

  # GET /circle_events/new
  def new
    @circle_event = CircleEvent.new
  end

  # GET /circle_events/1/edit
  def edit
  end

  # POST /circle_events
  # POST /circle_events.json
  def create
    @circle_event = CircleEvent.new(circle_event_params)

    respond_to do |format|
      if @circle_event.save
        format.html { redirect_to @circle_event, notice: 'Circle event was successfully created.' }
        format.json { render :show, status: :created, location: @circle_event }
      else
        format.html { render :new }
        format.json { render json: @circle_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circle_events/1
  # PATCH/PUT /circle_events/1.json
  def update
    respond_to do |format|
      if @circle_event.update(circle_event_params)
        format.html { redirect_to @circle_event, notice: 'Circle event was successfully updated.' }
        format.json { render :show, status: :ok, location: @circle_event }
      else
        format.html { render :edit }
        format.json { render json: @circle_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circle_events/1
  # DELETE /circle_events/1.json
  def destroy
    @circle_event.destroy
    respond_to do |format|
      format.html { redirect_to circle_events_url, notice: 'Circle event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle_event
      @circle_event = CircleEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_event_params
      params.require(:circle_event).permit(:title, :desc, :event_date, :place, :one_phrase)
    end
end

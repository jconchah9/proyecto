class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy, :finalizar, :rechazar]
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]
  # GET /calendars
  # GET /calendars.json
  def index
    @calendars = Calendar.all
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show; end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.study_id = cookies[:study_id] if calendar_params[:study_id].blank?
    respond_to do |format|
      if @calendar.save
        cookies.delete(:study_id)
        format.html { redirect_to history_admin_index_url(id: @calendar.study.petition_id), notice: 'Visita creada correctamente.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        cookies[:study_id] = @calendar.study_id if @calendar.study_id.present?
        format.html { render :new }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def finalizar
    @calendar.finalizar!
    respond_to do |format|
      format.html {
      redirect_to history_admin_index_url(id: @calendar.study.petition_id),
      notice: 'Cambio Realizado'
      }
    end
  end

  def rechazar
    @calendar.rechazar!
    respond_to do |format|
      format.html {
      redirect_to history_admin_index_url(id: @calendar.study.petition_id),
      notice: 'Cambio Realizado'
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  #  only allow the white list through.
  def calendar_params
    params.require(:calendar).permit(:visit_date, :sumary, :study_id)
  end
end

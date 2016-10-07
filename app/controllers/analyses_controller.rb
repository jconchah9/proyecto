class AnalysesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]
  before_action :set_analysis, only: [:show, :edit, :update, :destroy, :aceptar, :rechazar]

  # GET /analyses
  # GET /analyses.json
  def index
    @analyses = Analysis.all
  end

  # GET /analyses/1
  # GET /analyses/1.json
  def show; end

  # GET /analyses/new
  def new
    @analysis = Analysis.new
  end

  # GET /analyses/1/edit
  def edit; end

  # POST /analyses
  # POST /analyses.json
  def create
    @analysis = Analysis.new(analysis_params)
    @analysis.calendar_id = cookies[:calendar_id] if analysis_params[:calendar_id].blank?
    respond_to do |format|
      if @analysis.save
        cookies.delete(:calendar_id)
        format.html { redirect_to history_admin_index_url(id: @analysis.calendar.study.petition_id), notice: 'Analisis creado' }
        format.json { render :show, status: :created, location: @analysis }
      else
        cookies[:calendar_id] = @analysis.calendar_id if @analysis.calendar_id.present?
        format.html { render :new }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analyses/1
  # PATCH/PUT /analyses/1.json
  def update
    respond_to do |format|
      if @analysis.update(analysis_params)
        format.html { redirect_to @analysis, notice: 'Analysis was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis }
      else
        format.html { render :edit }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyses/1
  # DELETE /analyses/1.json
  def destroy
    @analysis.destroy
    respond_to do |format|
      format.html { redirect_to analyses_url, notice: 'Analysis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def aceptar
    @analysis.aceptar!
    redirect_to history_admin_index_url(id: @analysis.calendar.study.petition.id)
  end

  def rechazar
    @analysis.rechazar!
    redirect_to history_admin_index_url(id: @analysis.calendar.study.petition.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_analysis
    @analysis = Analysis.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  #  only allow the white list through.
  def analysis_params
    params.require(:analysis).permit(:summary, :calendar_id)
  end
end

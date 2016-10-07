class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy, :aceptar, :rechazar]
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]
  # GET /studies
  # GET /studies.json
  def index
    @studies = Study.all
  end

  # GET /studies/1
  # GET /studies/1.json
  def show; end

  # GET /studies/new
  def new
    @study = Study.new
    # @petition = Petition.where(id:params[:id])
  end

  # GET /studies/1/edit
  def edit; end

  # POST /studies
  # POST /studies.json
  def create
    @study = Study.new(study_params)
    @study.petition_id = cookies[:petition_id] if study_params[:petition_id].blank?
    respond_to do |format|
      if @study.save
        cookies.delete(:petition_id)
        format.html { redirect_to history_admin_index_url(id: @study.petition_id), notice: 'El estudio se creó correctamente.' }
        format.json { render :show, status: :created, location: @study }
      else
        cookies[:petition_id] = @study.petition_id if @study.petition_id.present?
        format.html { render :new }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studies/1
  # PATCH/PUT /studies/1.json
  def update
    respond_to do |format|
      if @study.update(study_params)
        format.html { redirect_to @study, notice: 'Estudio actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @study }
      else
        format.html { render :edit }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studies/1
  # DELETE /studies/1.json
  def destroy
    @study.destroy
    respond_to do |format|
      format.html { redirect_to studies_url, notice: 'Study was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def aceptar
    @study.aceptar!
    respond_to do |format|
      format.html {
        redirect_to history_admin_index_url(id: @study.petition_id),
        notice: 'Cambio Realizado'
      }
    end
  end

  def rechazar
    @study.rechazar!
    respond_to do |format|
      format.html {
        redirect_to history_admin_index_url(id: @study.petition_id),
        notice: 'Cambio Realizado'
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_study
    @study = Study.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def study_params
    params.require(:study).permit(:feasibility, :summary, :state, :petition_id)
  end
end

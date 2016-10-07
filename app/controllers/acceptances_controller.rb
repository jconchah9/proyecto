class AcceptancesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy, :rechazar, :aceptar]
  before_action :set_acceptance, only: [:show, :edit, :update, :destroy, :rechazar, :aceptar]

  # GET /acceptances
  # GET /acceptances.json
  def index
    @acceptances = Acceptance.all
  end

  # GET /acceptances/1
  # GET /acceptances/1.json
  def show; end

  # GET /acceptances/new
  def new
    @acceptance = Acceptance.new
  end

  # GET /acceptances/1/edit
  def edit; end

  # POST /acceptances
  # POST /acceptances.json
  def create
    @acceptance = Acceptance.new(acceptance_params)
    @acceptance.budget_id = cookies[:budget_id] if acceptance_params[:budget_id].blank?

    respond_to do |format|
      if @acceptance.save
        cookies.delete(:budget_id)
        format.html { redirect_to history_admin_index_url(id: @acceptance.budget.analysis.calendar.study.petition_id), notice: 'Se ha creado la aceptacion correctamente' }
        format.json { render :show, status: :created, location: @acceptance }
      else
        cookies[:budget_id] = acceptance_params[:budget_id]
        format.html { render :new }
        format.json { render json: @acceptance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acceptances/1
  # PATCH/PUT /acceptances/1.json
  def update
    respond_to do |format|
      if @acceptance.update(acceptance_params)
        format.html { redirect_to @acceptance, notice: 'Acceptance was successfully updated.' }
        format.json { render :show, status: :ok, location: @acceptance }
      else
        format.html { render :edit }
        format.json { render json: @acceptance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acceptances/1
  # DELETE /acceptances/1.json
  def destroy
    @acceptance.destroy
    respond_to do |format|
      format.html { redirect_to acceptances_url, notice: 'Acceptance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rechazar
    @acceptance.rechazar!
    respond_to do |format|
      format.html {
        redirect_to history_admin_index_url(id: @acceptance.budget.analysis.calendar.study.petition_id),
        notice: 'Cambio Realizado a "Rechazado".'
      }
    end
  end

  def aceptar
    @acceptance.aceptar!
    respond_to do |format|
      format.html {
        redirect_to history_admin_index_url(id: @acceptance.budget.analysis.calendar.study.petition_id),
        notice: 'Cambio Realizado a "Aceptado".'
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_acceptance
    @acceptance = Acceptance.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def acceptance_params
    params.require(:acceptance).permit(:summary, :budget_id)
  end
end

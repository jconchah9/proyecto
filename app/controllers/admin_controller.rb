class AdminController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :dashboard, :history, :request_service]
  def index; end

  def dashboard
    @studies = Study.count
    @studies_accepted = Study.where(state:'aceptado').count
    @petition = Petition.count
    @petition_without_seeing = Petition.where(state:'pendiente').count
    @calendars = Calendar.count
    @calendar_accepted = Calendar.where(state:'finalizada').count
    @analysis = Analysis.count
    @analysis_accepted = Analysis.where(state:'aceptada').count
  end

  def request_service
    @petitions = Petition.all.order(id: :asc)
  end

  def history
    @petition = Petition.where(id: params[:id])
    @study = Study.ordenadofecha.where(petition_id: @petition)
    @calendar = Calendar.ordencalendario.where(study_id: @study)
    @analisis = Analysis.where(calendar_id: @calendar)
    @presupuesto = Budget.where(analysis_id: @analisis)
    @aceptacion = Acceptance.where(budget_id: @presupuesto)
  end
end

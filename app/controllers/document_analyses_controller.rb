class DocumentAnalysesController < ApplicationController
  before_action :set_document_analysis, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]
  # GET /document_analyses
  # GET /document_analyses.json
  def index
    @document_analyses = DocumentAnalysis.all
  end

  # GET /document_analyses/1
  # GET /document_analyses/1.json
  def show; end

  # GET /document_analyses/new
  def new
    @document_analysis = DocumentAnalysis.new
  end

  # GET /document_analyses/1/edit
  def edit; end

  # POST /document_analyses
  # POST /document_analyses.json
  def create
    @document_analysis = DocumentAnalysis.new(document_analysis_params)
    @document_analysis.analysis_id = cookies[:analysis_id] if document_analysis_params[:analysis_id].blank?
    respond_to do |format|
      if @document_analysis.save
        cookies.delete(:analysis_id)
        format.html { redirect_to history_admin_index_url(id: @document_analysis.analysis.calendar.study.petition_id), notice: 'Documento guardado correctamente' }
        format.json { render :show, status: :created, location: @document_analysis }
      else
        cookies[:analysis_id] = @document_analysis.analysis_id if @document_analysis.analysis_id.present?
        format.html { render :new }
        format.json { render json: @document_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_analyses/1
  # PATCH/PUT /document_analyses/1.json
  def update
    respond_to do |format|
      if @document_analysis.update(document_analysis_params)
        format.html { redirect_to @document_analysis, notice: 'Document analysis was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_analysis }
      else
        format.html { render :edit }
        format.json { render json: @document_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_analyses/1
  # DELETE /document_analyses/1.json
  def destroy
    @document_analysis.destroy
    respond_to do |format|
      format.html { redirect_to document_analyses_url, notice: 'Document analysis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document_analysis
    @document_analysis = DocumentAnalysis.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  #  only allow the white list through.
  def document_analysis_params
    params.require(:document_analysis).permit(:name, :descripcion, :document, :analysis_id)
  end
end

class BudgetDocumentsController < ApplicationController
  before_action :set_budget_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]
  # GET /budget_documents
  # GET /budget_documents.json
  def index
    @budget_documents = BudgetDocument.all
  end

  # GET /budget_documents/1
  # GET /budget_documents/1.json
  def show; end

  # GET /budget_documents/new
  def new
    @budget_document = BudgetDocument.new
    @budget_document.build_budget
  end

  # GET /budget_documents/1/edit
  def edit; end

  # POST /budget_documents
  # POST /budget_documents.json
  def create
    @budget_document = BudgetDocument.new(budget_document_params)
    @budget_document.budget.analysis_id = cookies[:analysis_id] if params[:budget_document][:budget_attributes][:analysis_id].blank?

    respond_to do |format|
      if @budget_document.save
        cookies.delete(:analysis_id)
        format.html { redirect_to history_admin_index_url(id: @budget_document.budget.analysis.calendar.study.petition_id), notice: 'Se ha creado correctamente el presupuesto' }
        format.json { render :show, status: :created, location: @budget_document }
      else
        cookies[:analysis_id] = @budget_document.budget.analysis_id if @budget_document.budget.analysis_id.present?
        format.html { render :new }
        format.json { render json: @budget_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budget_documents/1
  # PATCH/PUT /budget_documents/1.json
  def update
    respond_to do |format|
      if @budget_document.update(budget_document_params)
        format.html { redirect_to @budget_document, notice: 'Budget document was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget_document }
      else
        format.html { render :edit }
        format.json { render json: @budget_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_documents/1
  # DELETE /budget_documents/1.json
  def destroy
    @budget_document.destroy
    respond_to do |format|
      format.html { redirect_to budget_documents_url, notice: 'Budget document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_budget_document
    @budget_document = BudgetDocument.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  #  only allow the white list through.
  def budget_document_params
    params.require(:budget_document).permit(:name, :description, :document, budget_attributes: [:summary, :analysis_id])
  end
end

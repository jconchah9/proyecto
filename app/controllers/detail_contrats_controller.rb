class DetailContratsController < ApplicationController
  before_action :set_detail_contrat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]
  # GET /detail_contrats
  # GET /detail_contrats.json
  def index
    @detail_contrats = DetailContrat.all
  end

  # GET /detail_contrats/1
  # GET /detail_contrats/1.json
  def show; end

  # GET /detail_contrats/new
  def new
    @detail_contrat = DetailContrat.new
  end

  # GET /detail_contrats/1/edit
  def edit; end

  # POST /detail_contrats
  # POST /detail_contrats.json
  def create
    @detail_contrat = DetailContrat.new(detail_contrat_params)

    respond_to do |format|
      if @detail_contrat.save
        format.html { redirect_to @detail_contrat, notice: 'Detail contrat was successfully created.' }
        format.json { render :show, status: :created, location: @detail_contrat }
      else
        format.html { render :new }
        format.json { render json: @detail_contrat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_contrats/1
  # PATCH/PUT /detail_contrats/1.json
  def update
    respond_to do |format|
      if @detail_contrat.update(detail_contrat_params)
        format.html { redirect_to @detail_contrat, notice: 'Detail contrat was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_contrat }
      else
        format.html { render :edit }
        format.json { render json: @detail_contrat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_contrats/1
  # DELETE /detail_contrats/1.json
  def destroy
    @detail_contrat.destroy
    respond_to do |format|
      format.html { redirect_to detail_contrats_url, notice: 'Detail contrat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_detail_contrat
    @detail_contrat = DetailContrat.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  #  only allow the white list through.
  def detail_contrat_params
    params.require(:detail_contrat).permit(:start_date, :end_date, :qty_sensores, :contract_id, :group_id, :sector_id)
  end
end

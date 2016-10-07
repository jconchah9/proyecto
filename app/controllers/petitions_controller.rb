class PetitionsController < ApplicationController
  before_action :set_petition, only: [:show, :edit, :update, :destroy, :ver]
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]
  # GET /petitions
  # GET /petitions.json
  def index
    @petitions = Petition.includes(:client).all
  end

  # GET /petitions/1
  # GET /petitions/1.json
  def show; end

  # GET /petitions/new
  def new
    @petition = Petition.new
    @petition.build_client
  end

  # GET /petitions/1/edit
  def edit; end

  # POST /petitions
  # POST /petitions.json
  def create
    @petition = Petition.new(petition_params)

    respond_to do |format|
      if @petition.save
        format.html { redirect_to @petition, notice: 'Solicitud fue creada con éxito.' }
        format.json { render :show, status: :created, location: @petition }
      else
        format.html { render :new }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petitions/1
  # PATCH/PUT /petitions/1.json
  def update
    respond_to do |format|
      if @petition.update(petition_params)
        format.html { redirect_to @petition, notice: 'Solicitud se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @petition }
      else
        format.html { render :edit }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions/1
  # DELETE /petitions/1.json
  def destroy
    @petition.destroy
    respond_to do |format|
      format.html { redirect_to petitions_url, notice: 'Petition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ver
    @petition.ver!
    respond_to do |format|
      format.html {
        redirect_to history_admin_index_url(id: @petition.id),
        notice: 'Cambio Realizado'
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_petition
    @petition = Petition.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def petition_params
    params.require(:petition).permit(:request, :summary, client_attributes: [:id, :name, :enterprise, :commercial_business, :telephone, :cellphone, :email])
  end
end

class RestrictionsController < ApplicationController
  before_action :set_restriction, only: [:show, :edit, :update, :destroy]

  def index
    @restriction = Restriction.where(sector_id: params[:sector_id])
  end

  def show
    #code
  end

  def new

    @restriction = Restriction.new
    @restriction.sector_id = params[:sector_id]
  end

  def create
    @restriction = Restriction.new(restriction_params)

    respond_to do |format|
      if @restriction.save
        format.html { redirect_to sector_path(@restriction.sector), notice: 'Se ha guardado correctamente la restricción para el sector'}
      else
        format.html { render :new }
        format.json { render json: @resource }
      end
    end
  end

  def edit
    #code
  end

  def update
    respond_to do |format|
      if @restriction.update!(restriction_params)
        format.html { redirect_to @restriction.sector, notice: 'La restriction fue actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @restriction }
      else
        format.html { render :edit }
        format.json { render json: @plrestrictionant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #code
  end

  private

  def restriction_params
    params.require(:restriction).permit(:minimum_value, :maximum_value, :harvest_date, :sector_id)
  end

  def set_restriction
    @restriction = Restriction.find_by(sector_id: params[:sector_id])
    redirect_to new_restriction_path(sector_id: params[:sector_id]) if @restriction.nil?
  end
end

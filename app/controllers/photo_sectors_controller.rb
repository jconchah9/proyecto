class PhotoSectorsController < ApplicationController
  before_action :set_photo_sector, only: [:show, :edit, :update, :destroy]

  # GET /photo_sectors
  # GET /photo_sectors.json
  def index
    @photo_sectors = PhotoSector.all
  end

  # GET /photo_sectors/1
  # GET /photo_sectors/1.json
  def show; end

  # GET /photo_sectors/new
  def new
    @photo_sector = PhotoSector.new
  end

  # GET /photo_sectors/1/edit
  def edit; end

  # POST /photo_sectors
  # POST /photo_sectors.json
  def create
    @photo_sector = PhotoSector.new(photo_sector_params)

    respond_to do |format|
      if @photo_sector.save
        format.html { redirect_to @photo_sector, notice: 'Photo sector was successfully created.' }
        format.json { render :show, status: :created, location: @photo_sector }
      else
        format.html { render :new }
        format.json { render json: @photo_sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_sectors/1
  # PATCH/PUT /photo_sectors/1.json
  def update
    respond_to do |format|
      if @photo_sector.update(photo_sector_params)
        format.html { redirect_to @photo_sector, notice: 'Photo sector was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_sector }
      else
        format.html { render :edit }
        format.json { render json: @photo_sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_sectors/1
  # DELETE /photo_sectors/1.json
  def destroy
    @photo_sector.destroy
    respond_to do |format|
      format.html { redirect_to photo_sectors_url, notice: 'Photo sector was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo_sector
    @photo_sector = PhotoSector.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_sector_params
    params.require(:photo_sector).permit(:name, :type_file, :descripcion, :document, :sector_id)
  end
end

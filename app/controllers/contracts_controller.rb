class ContractsController < ApplicationController

  def index
    redirect_to request_service_admin_index_path
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
    @contract.build_company
  end

  def new_detail
    @detail_contract = DetailContract.new
    @detail_contract.sector = Sector.new
    @detail_contract.sector.plant = Plant.new
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.acceptance_id = cookies[:acceptance_id] if contract_params[:acceptance_id].blank?

    company = Company.find_by(rut: contract_params[:company_attributes][:rut])
    @contract.company = company if company.present?
    respond_to do |format|
      if @contract.save
        cookies.delete(:acceptance_id)
        format.html { redirect_to new_detail_contracts_path(contract_id: @contract.id), notice: 'Se ha guardado correctamente el primer paso'}
      else
        cookies[:acceptance_id] = @contract.acceptance_id if @contract.acceptance_id.present?
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end



  def create_detail
    @detail_contract = DetailContract.new(detail_contract_params)
    @detail_contract.contract_id = cookies[:contract_id] if detail_contract_params[:contract_id].blank?
    plant = Plant.find_by(name: detail_contract_params[:sector_attributes][:plant_attributes][:name], company_id: @detail_contract.contract.company_id )
  
    @detail_contract.sector.plant= plant if plant.present?
    @detail_contract.sector.plant.company_id = @detail_contract.contract.company_id if plant.blank?
    respond_to do |format|
      if @detail_contract.save
        cookies.delete(:contract_id)
        format.html { redirect_to request_service_admin_index_path, notice: 'Se ha generado el contracto correctamente. Buen trabajo !!'}
      else
        cookies[:contract_id] = @detail_contract.contract_id if @detail_contract.contract_id.present?
        format.html { render :new_detail }
        format.json { render json: @detail_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def contract_params
    params.require(:contract).permit(:acceptance_id, :start_date, :end_date, company_attributes: [:name, :commercial_business, :rut])
  end

  def detail_contract_params
    params.require(:detail_contract).permit(:contract_id, sector_attributes: [:name, plant_attributes: [:name, :address, :number, :commune, :city]])
  end
end

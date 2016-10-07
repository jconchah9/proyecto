class AccountsController < ApplicationController

  def index

  end

  def show

  end

  def new
    @account = Account.new
    @account.company_id = params[:company_id]
    @account.build_user
  end
  def create
    @account = Account.new(account_params)
    user = User.find_by(email: account_params[:user_attributes][:email])
    @account.user = user if user.present?

    respond_to do |format|
      if @account.save
        format.html { redirect_to companies_path(@account.company_id), notice: 'Usuario Creado Correctamente' }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete

  end

  def update

  end

  def edit

  end

  private

  def account_params
    params.require(:account).permit(:company_id, user_attributes: [:email, :password,:password_confirmation, :name, :last_name])
  end
end

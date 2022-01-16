class AdaptersController < ApplicationController
  before_action :set_adapter!, only: %i[edit update destroy show]
  
  def index
    @pagy, @adapters = pagy Adapter.order(created_at: :desc), page: adapter_restore_page
    
    remember_page
  end

  def new
    @adapter = Adapter.new
  end

  def create
    @adapter = Adapter.new adapter_params

    if @adapter.save
      flash[:success] = "Adapter added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    remember_action
  end

  def update
    if @adapter.update adapter_params
      flash[:success] = "Adapter updated!"
      redirect_to adapter_path(@adapter)
    else
      render :edit
    end
  end

  def destroy
    @adapter.destroy
    flash[:success] = "Adapter deleted!"
    redirect_to root_path
  end

  def show
    remember_action
  end

  private

  def adapter_params
    params.require(:adapter).permit(:name, :vendor_id, :adapter_type_id, :connection_type_id)
  end

  def set_adapter!
    @adapter = Adapter.find params[:id]
  end
  
end

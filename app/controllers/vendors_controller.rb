class VendorsController < ApplicationController
  before_action :set_vendor!, only: %i{ edit update destroy }
  
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new vendor_params

    if @vendor.save
      flash[:success] = "Vendor added!"
      redirect_to vendors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @vendor.update vendor_params
      flash[:success] = "Vendor updated!"
      redirect_to vendors_path
    else
      render :edit
    end
  end

  def destroy
    @vendor.destroy
    flash[:success] = "Vendor deleted!"
    redirect_to vendors_path
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name)
  end

  def set_vendor!
    @vendor = Vendor.find params[:id]
  end
  
end

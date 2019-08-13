class RecordsController < ApplicationController
  before_action :get_record, only: [:show, :edit, :destroy]

  def index
    @records = Record.all
    render json: { records: @records }, status: 200
  end

  def show
    render json: { record: @record }, status: 200
  end

  def new
    render json: { }, status: 200
  end

  def create
    @record = Record.new(record_params)
    if @record.save!
      render json: { record: @record }, status: 201
    else
      render json: { errors: @record.errors }, status: 422
    end
  end

  def destroy
    if @record.destroy
      redirect_to records_path, notice: 'record destroyed'
    else
      redirect_to record_path(@record), notice: 'unable to destroy'
    end
  end

  private

  def get_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:record_index, :date_open, :record_status, :record_location, :record_type, :description, :planner, :record_module, :city, :state, :zip_code)
  end
end

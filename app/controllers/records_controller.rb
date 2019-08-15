class RecordsController < ApplicationController
  before_action :get_record, only: [:show, :edit, :destroy]
  before_action :set_s3_direct_post, only: [:import_new, :import]
  before_action :get_briq, only: [:import]

  def index
    @records = Record.all
  end

  def show

  end

  def import_new

  end

  def import
    o_lo "in import"
    begin
      fileUrl = params[:fileUrl]
      Delayed::Job.enqueue Records::SortRecords.new(fileUrl, @briq)
      render json: { redirect_url: briq_path(@briq) }
      # send the file to a background job for processing
    rescue Exception => e
      o_lo e.inspect
      # do something
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

  def get_briq
    @briq = Briq.find(params[:briq_id])
  end

  def record_params
    params.require(:record).permit(:record_index, :date_open, :record_status, :record_location, :record_type, :description, :planner, :record_module, :city, :state, :zip_code)
  end
end

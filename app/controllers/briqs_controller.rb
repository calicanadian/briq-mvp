class BriqsController < ApplicationController
  before_action :get_briq, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:show]
  # GET /briqs || /
  def index
    @briqs = Briq.all
  end

  # GET /briqs/:id
  def show
    @briq_records = JSON.parse(BriqRecord.get_construction_records(@briq.id).uniq.to_json, object_class: OpenStruct)
  end

  # GET /briqs/new
  def new
    @briq = Briq.new
  end

  # GET /briqs/:id/edit
  def edit

  end

  # POST /briqs
  def create
    @briq = Briq.new(briq_params)
    if @briq.save!
      redirect_to @briq, notice: "#{@briq.name} created!"
    else
      redirect_to new_briq_path, notice: "#{@briq.errors}, unable to create"
    end
  end

  # PATCH /briqs/:id
  def update
    name = params[:name].blank? ? @briq.name : params[:name]
    description = params[:description].blank? ? @briq.description : params[:description]
    @briq.update(name: name, description: description)
  end

  # DELETE /briqs/:id
  def destroy
    @briq.destroy
    redirect_to briqs_path
  end

  private

  def get_briq
    @briq = Briq.find(params[:id])
  end

  def briq_params
    params.require(:briq).permit(:name, :description)
  end
end

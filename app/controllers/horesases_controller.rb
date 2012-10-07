class HoresasesController < ApplicationController
  # GET /horesases
  # GET /horesases.json
  def index
    @horesases = Horesase.all
    @horesase_boys = JSON.parse(`curl http://cloud.github.com/downloads/june29/horesase-boys/meigens.json`)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @horesases }
    end
  end

  # POST /horesases
  # POST /horesases.json
  def create
    @horesase = Horesase.new(params[:horesase])

    respond_to do |format|
      if @horesase.save
        format.html { redirect_to @horesase, notice: 'Horesase was successfully created.' }
        format.json { render json: @horesase, status: :created, location: @horesase }
      else
        format.html { render action: "new" }
        format.json { render json: @horesase.errors, status: :unprocessable_entity }
      end
    end
  end
end

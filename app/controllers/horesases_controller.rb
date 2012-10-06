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

  # GET /horesases/1
  # GET /horesases/1.json
  def show
    @horesase = Horesase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @horesase }
    end
  end

  # GET /horesases/new
  # GET /horesases/new.json
  def new
    @horesase = Horesase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @horesase }
    end
  end

  # GET /horesases/1/edit
  def edit
    @horesase = Horesase.find(params[:id])
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

  # PUT /horesases/1
  # PUT /horesases/1.json
  def update
    @horesase = Horesase.find(params[:id])

    respond_to do |format|
      if @horesase.update_attributes(params[:horesase])
        format.html { redirect_to @horesase, notice: 'Horesase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @horesase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horesases/1
  # DELETE /horesases/1.json
  def destroy
    @horesase = Horesase.find(params[:id])
    @horesase.destroy

    respond_to do |format|
      format.html { redirect_to horesases_url }
      format.json { head :no_content }
    end
  end
end

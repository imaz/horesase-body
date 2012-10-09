require 'net/http'

class HoresasesController < ApplicationController
  MEIGENS_URL = 'http://cloud.github.com/downloads/june29/horesase-boys/meigens.json'

  # GET /horesases
  # GET /horesases.json
  def index
    @horesases = Horesase.all
    @horesase_boys = JSON.parse(fetch_meigens)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @horesases }
    end
  end

  # POST /horesases
  # POST /horesases.json
  def create
    Horesase.transaction do
      params[:horesases].each do |_,data|
        @horesase = Horesase.find_or_create_by_id(data["id"])
        @horesase.body = data["body"]
        @horesase.save
      end
    end

    respond_to do |format|
      format.json { render json: @horesase, status: :created, location: @horesase }
    end

    rescue => e
    respond_to do |format|
      format.json { render json: @horesase.errors, status: :unprocessable_entity }
    end
  end

  private

  def fetch_meigens
    Net::HTTP.get(URI.parse(MEIGENS_URL))
  end
end

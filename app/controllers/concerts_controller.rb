class ConcertsController < ApplicationController
  before_action :set_concert, only: %w[ show edit update destroy ]

  # GET /concerts
  # GET /concerts.json
  def index
    @concerts = Concert.all
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
    @groups = Group.all
  end

  # GET /concerts/1/edit
  def edit
    @groups = Group.all

  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new(concert_params)
    @groups = Group.all

    respond_to do |format|
      if @concert.save
        format.html { redirect_to @concert, notice: "Concert was successfully created." }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to @concert, notice: "Concert was successfully updated." }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: "Concert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def concert_params
      params.require(:concert).permit(:date, :place, :participants, :group_id, :duration)
    end
end

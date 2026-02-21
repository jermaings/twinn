class CondimentAmtsController < ApplicationController
  before_action :set_condiment_amt, only: %i[ show edit update destroy ]

  # GET /condiment_amts or /condiment_amts.json
  def index
    @condiment_amts = CondimentAmt.all
  end

  # GET /condiment_amts/1 or /condiment_amts/1.json
  def show
  end

  # GET /condiment_amts/new
  def new
    @condiment_amt = CondimentAmt.new
  end

  # GET /condiment_amts/1/edit
  def edit
  end

  # POST /condiment_amts or /condiment_amts.json
  def create
    @condiment_amt = CondimentAmt.new(condiment_amt_params)

    respond_to do |format|
      if @condiment_amt.save
        format.html { redirect_to @condiment_amt, notice: "Condiment amt was successfully created." }
        format.json { render :show, status: :created, location: @condiment_amt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @condiment_amt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condiment_amts/1 or /condiment_amts/1.json
  def update
    respond_to do |format|
      if @condiment_amt.update(condiment_amt_params)
        format.html { redirect_to @condiment_amt, notice: "Condiment amt was successfully updated." }
        format.json { render :show, status: :ok, location: @condiment_amt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @condiment_amt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condiment_amts/1 or /condiment_amts/1.json
  def destroy
    @condiment_amt.destroy!

    respond_to do |format|
      format.html { redirect_to condiment_amts_path, status: :see_other, notice: "Condiment amt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condiment_amt
      @condiment_amt = CondimentAmt.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def condiment_amt_params
      params.expect(condiment_amt: [ :small, :medium, :large ])
    end
end

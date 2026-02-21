class CondimentsController < ApplicationController
  before_action :set_condiment, only: %i[ show edit update destroy ]

  # GET /condiments or /condiments.json
  def index
    @condiments = Condiment.all
  end

  # GET /condiments/1 or /condiments/1.json
  def show
  end

  # GET /condiments/new
  def new
    @condiment = Condiment.new
  end

  # GET /condiments/1/edit
  def edit
  end

  # POST /condiments or /condiments.json
  def create
    @params_condiments_id = params[:condiments][:condiments_id]
    @foodItems_association = FoodItem.find_by(condiments_id: @params_condiments_id)
    @foodItems_association_id = @foodItems_association.condiments_id
    @condiment = Condiment.new(condiment_params)
    @condiment.food_item = @foodItems_association
    @condiment.food_item_id = @foodItems_association_id
    # @condiment.food_item = FoodItem.first # <--- Add this line
    #   if @condiment.food_item
    #     flash[:notice] = "Condiment was created successfully." 
    #     redirect_to @food_item
    #   else 
    #     render 'new' 
    #   end 
          respond_to do |format|
            if @condiment.save
              format.html { redirect_to @condiment, notice: "Condiment was successfully created." }
              format.json { render :show, status: :created, location: @condiment }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @condiment.errors, status: :unprocessable_entity }
            end
          end
  end

  # PATCH/PUT /condiments/1 or /condiments/1.json
  def update
    respond_to do |format|
      if @condiment.update(condiment_params)
        format.html { redirect_to @condiment, notice: "Condiment was successfully updated." }
        format.json { render :show, status: :ok, location: @condiment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @condiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condiments/1 or /condiments/1.json
  def destroy

    @condiment.destroy!
    respond_to do |format|
      format.html { redirect_to condiments_path, status: :see_other, notice: "Condiment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condiment
      @condiment = Condiment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def condiment_params
      params.expect(condiment: [ :price, :checked ])
    end
end

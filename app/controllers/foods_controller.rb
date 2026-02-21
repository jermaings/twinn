class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]

  # GET /foods or /foods.json
  def index
    @title = 'Twinn Kiss in Clayton, NJ'
    @foods = Food.all.in_order_of(:category, [
      'Burgers and Dogs',
      'Steaks',
      'Sandwiches',
      'Subs',
      'Sides',
      'Pretzels',
      'Sundaes',
      'Sodas',
      'Shakes and Malts',
      'Ice Cream',
      'WaterIce and Gelattis',
      'Yogurt',
      'Slushies',
      'Artic Swirls',
      'Sherbert',
      'Additional Items',
      'Other'
    ])
    
    @showselectlunch = false 
    @foods_cat_desert =  Food.find_by category: 'Desert'
    @foods_cat_lunch =  Food.find_by category: 'Lunch'
    @foods_cat_drinks =  Food.find_by category: 'Drinks'
    
  end
  def toggelling

    @select_foods_lunch = Food.where(category:"Lunch") 
    @select_foods_desert = Food.where(category:"Desert") 
    @select_foods_drinks = Food.where(category:"Drinks")

     if params[:section] == 'lunch'
      @showCategory = @select_foods_lunch
    elsif 
      params[:section] == 'desert'
      @showCategory = @select_foods_desert
    elsif 
      params[:section] == 'drinks'
      @showCategory = @select_foods_drinks
    end

      render "sections/toggelling"
  end

  # GET /foods/1 or /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy!

    respond_to do |format|
      format.html { redirect_to foods_path, status: :see_other, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.expect(food: [ :category, :image ])
    end
end

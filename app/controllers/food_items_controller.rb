class FoodItemsController < ApplicationController
  before_action :set_food_item, only: %i[ show edit update destroy ]
  # GET /food_items or /food_items.json
  def index
    @food_1 = FoodItem.where(category: 'Burgers and Dogs')
    @food_2 = FoodItem.where(category: 'Steaks')
    @food_3 = FoodItem.where(category: 'Subs')
    @food_17 = FoodItem.where(category: 'Sandwiches')
    @food_4 = FoodItem.where(category: 'Sides')
    @food_5 = FoodItem.where(category: 'Pretzels')
    @food_6 = FoodItem.where(category: 'Sundaes')
    @food_7 = FoodItem.where(category: 'Sodas')
    @food_9 = FoodItem.where(category: 'Shakes and Malts')
    @food_10 = FoodItem.where(category: 'Ice Cream')
    @food_11 = FoodItem.where(category: 'WaterIce and Gelattis')
    @food_12 = FoodItem.where(category: 'Yogurt')
    @food_13 = FoodItem.where(category: 'Slushies')
    @food_14 = FoodItem.where(category: 'Artic Swirls')
    @food_15 = FoodItem.where(category: 'Sherbert')
    @food_16 = FoodItem.where(category: 'Additional Items')
    @food_18 = FoodItem.where(category: 'Other')

    @foods = Food.all.includes(:food_items).in_order_of(:category, [
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
    @food_items = FoodItem.all
    #need a action to capture click event to foodcategory for creating new item
  end

  # GET /food_items/1 or /food_items/1.json
  def show
  end

  # GET /food_items/new
  def new
    @food_item = FoodItem.new
  end

  # GET /food_items/1/edit
  def edit
  end

  # POST /food_items or /food_items.json
  def create
    #@food_association = Food.first
    @params_category = params[:food_item][:category]
    @user_association = Food.find_by(category: @params_category) 
    puts `"FOOD ITEM"  + @user_association`
    @user_association_id = @user_association.food_id
    @food_item = FoodItem.new(food_item_params)
    @food_item.food = @user_association 
    @food_item.food_id = @user_association_id


    respond_to do |format|
      if @food_item.save
        format.html { redirect_to @food_item, notice: "Food item was successfully created." }
        format.json { render :show, status: :created, location: @food_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_items/1 or /food_items/1.json
  def update
    respond_to do |format|
      if @food_item.update(food_item_params)
        format.html { redirect_to @food_item, notice: "Food item was successfully updated." }
        format.json { render :show, status: :ok, location: @food_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_items/1 or /food_items/1.json
  def destroy
    @food_item.destroy!

    respond_to do |format|
      format.html { redirect_to food_items_path, status: :see_other, notice: "Food item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_item
      @food_item = FoodItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def food_item_params
      params.expect(food_item: [ :name, :category, :price, :comments, :food_id ])
    end   
end

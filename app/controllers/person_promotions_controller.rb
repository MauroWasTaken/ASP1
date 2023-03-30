class PersonPromotionsController < ApplicationController
  before_action :set_person_promotion, only: %i[ show edit update destroy ]

  # GET /person_promotions or /person_promotions.json
  def index
    @person_promotions = PersonPromotion.all
  end

  # GET /person_promotions/1 or /person_promotions/1.json
  def show
  end

  # GET /person_promotions/new
  def new
    @person_promotion = PersonPromotion.new
  end

  # GET /person_promotions/1/edit
  def edit
  end

  # POST /person_promotions or /person_promotions.json
  def create
    @person_promotion = PersonPromotion.new(person_promotion_params)

    respond_to do |format|
      if @person_promotion.save
        format.html { redirect_to person_promotion_url(@person_promotion), notice: "Person promotion was successfully created." }
        format.json { render :show, status: :created, location: @person_promotion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_promotions/1 or /person_promotions/1.json
  def update
    respond_to do |format|
      if @person_promotion.update(person_promotion_params)
        format.html { redirect_to person_promotion_url(@person_promotion), notice: "Person promotion was successfully updated." }
        format.json { render :show, status: :ok, location: @person_promotion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_promotions/1 or /person_promotions/1.json
  def destroy
    @person_promotion.destroy

    respond_to do |format|
      format.html { redirect_to person_promotions_url, notice: "Person promotion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_promotion
      @person_promotion = PersonPromotion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_promotion_params
      params.require(:person_promotion).permit(:promotion_id, :person_id)
    end
end

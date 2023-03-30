class LecturePromotionsController < ApplicationController
  before_action :set_lecture_promotion, only: %i[ show edit update destroy ]

  # GET /lecture_promotions or /lecture_promotions.json
  def index
    @lecture_promotions = LecturePromotion.all
  end

  # GET /lecture_promotions/1 or /lecture_promotions/1.json
  def show
  end

  # GET /lecture_promotions/new
  def new
    if current_person.teacher?
      @lecture_promotion = LecturePromotion.new
    else
      redirect_to :back
    end

  end

  # GET /lecture_promotions/1/edit
  def edit
  end

  # POST /lecture_promotions or /lecture_promotions.json
  def create
    @lecture_promotion = LecturePromotion.new(lecture_promotion_params)

    respond_to do |format|
      if @lecture_promotion.save
        format.html { redirect_to lecture_promotion_url(@lecture_promotion), notice: "Lecture promotion was successfully created." }
        format.json { render :show, status: :created, location: @lecture_promotion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lecture_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecture_promotions/1 or /lecture_promotions/1.json
  def update
    respond_to do |format|
      if @lecture_promotion.update(lecture_promotion_params)
        format.html { redirect_to lecture_promotion_url(@lecture_promotion), notice: "Lecture promotion was successfully updated." }
        format.json { render :show, status: :ok, location: @lecture_promotion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lecture_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecture_promotions/1 or /lecture_promotions/1.json
  def destroy
    @lecture_promotion.destroy

    respond_to do |format|
      format.html { redirect_to lecture_promotions_url, notice: "Lecture promotion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_promotion
      @lecture_promotion = LecturePromotion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecture_promotion_params
      params.require(:lecture_promotion).permit(:lecture_id, :promotion_id, :semester_id, :person_id)
    end
end

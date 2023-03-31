class LectureGradesController < ApplicationController
  before_action :set_lecture_grade, only: %i[ show edit update destroy ]

  # GET /lecture_grades or /lecture_grades.json
  def index
    redirect_to '/lectures'
  end

  # GET /lecture_grades/1 or /lecture_grades/1.json
  def show
    redirect_to '/lectures'
  end

  # GET /lecture_grades/new
  def new
    if current_person.teacher?
      @lecture_grade = LectureGrade.new
    else
      redirect_to '/lectures'
    end
  end

  # GET /lecture_grades/1/edit
  def edit
  end

  # POST /lecture_grades or /lecture_grades.json
  def create
    @lecture_grade = LectureGrade.new(lecture_grade_params)

    respond_to do |format|
      if @lecture_grade.save
        format.html { redirect_to lecture_grade_url(@lecture_grade), notice: "Lecture grade was successfully created." }
        format.json { render :show, status: :created, location: @lecture_grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lecture_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecture_grades/1 or /lecture_grades/1.json
  def update
    respond_to do |format|
      if @lecture_grade.update(lecture_grade_params)
        format.html { redirect_to lecture_grade_url(@lecture_grade), notice: "Lecture grade was successfully updated." }
        format.json { render :show, status: :ok, location: @lecture_grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lecture_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecture_grades/1 or /lecture_grades/1.json
  def destroy
    @lecture_grade.destroy

    respond_to do |format|
      format.html { redirect_to lecture_grades_url, notice: "Lecture grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_grade
      @lecture_grade = LectureGrade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecture_grade_params
      params.require(:lecture_grade).permit(:lecture_id, :grade_id)
    end
end

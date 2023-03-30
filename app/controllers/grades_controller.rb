class GradesController < ApplicationController
  before_action :set_grade, only: %i[ show edit update destroy ]

  # GET /grades or /grades.json
  def index
    if current_user.student?
      @grades = Grade.where(student_id: current_user.id)
    elsif current_user.teacher?
      @grades = Grade.all
    end
      
  end

  # GET /grades/1 or /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    if(current_user.teacher?)
      @grade = Grade.new
    else
      redirect_to '/grades'
    end      
  end

  # GET /grades/1/edit
  def edit
    if(!current_user.teacher?)
      redirect_to '/grades'
    end  
  end

  # POST /grades or /grades.json
  def create
    if(current_user.teacher?)
      @grade = Grade.new(grade_params)

      respond_to do |format|
        if @grade.save
          format.html { redirect_to grade_url(@grade), notice: "Grade was successfully created." }
          format.json { render :show, status: :created, location: @grade }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @grade.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/grades'
    end  
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    if(current_user.teacher?)
      respond_to do |format|
        if @grade.update(grade_params)
          format.html { redirect_to grade_url(@grade), notice: "Grade was successfully updated." }
          format.json { render :show, status: :ok, location: @grade }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @grade.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/grades'
    end  
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    if(current_user.teacher?)
      @grade.destroy

      respond_to do |format|
        format.html { redirect_to grades_url, notice: "Grade was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to '/grades'
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:name, :result, :weight, :date, :semester_id, :promotion_id, :student_id, :teacher_id)
    end
end

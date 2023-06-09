class LecturesController < ApplicationController
  before_action :set_lecture, only: %i[ show edit update destroy ]

  # GET /lectures or /lectures.json
  def index
    if current_person.teacher?
      @lectures = current_person.lectures
    else
      @lectures = Lecture.all
    end
  end

  # GET /lectures/1 or /lectures/1.json
  def show
  end

  # GET /lectures/new
  def new
    if(current_person.teacher?)
      @lecture = Lecture.new
    else
      redirect_to '/lectures'
    end
  end

  # GET /lectures/1/edit
  def edit
    if(!current_person.teacher?)
      redirect_to '/lectures'
    end
  end

  # POST /lectures or /lectures.json
  def create
      @lecture = Lecture.new(lecture_params)

      respond_to do |format|
        if @lecture.save
          format.html { redirect_to lecture_url(@lecture), notice: "Lecture was successfully created." }
          format.json { render :show, status: :created, location: @lecture }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @lecture.errors, status: :unprocessable_entity }
        end
      end 
  end

  # PATCH/PUT /lectures/1 or /lectures/1.json
  def update
    if(current_person.teacher?)
      respond_to do |format|
        if @lecture.update(lecture_params)
          format.html { redirect_to lecture_url(@lecture), notice: "Lecture was successfully updated." }
          format.json { render :show, status: :ok, location: @lecture }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @lecture.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/grades'
    end  
  end

  # DELETE /lectures/1 or /lectures/1.json
  def destroy
    if(current_person.teacher?)
      @lecture.destroy

      respond_to do |format|
        format.html { redirect_to lectures_url, notice: "Lecture was successfully destroyed." }
        format.json { head :no_content }
      end
      
    else
      redirect_to '/grades'
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lecture_params
      params.require(:lecture).permit(:name, :description, :category_id)
    end
end

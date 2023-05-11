class EnrollmentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_enrollment, only: %i[ show edit update destroy ]

  # GET /enrollments or /enrollments.json
  def index
    @enrollments = Enrollment.all
    @enrollments = if current_user.admin?
      Enrollment.includes(:course, :batch, :school, :student).all
    elsif current_user.school_admin?
      Enrollment.includes(:course, :batch, :school, :student).my_school_entries(current_user&.school&.id)
    else
      Enrollment.includes(:course, :batch, :school, :student).mine(current_user.id)
    end
  end

  # GET /enrollments/1 or /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments or /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.status = current_user.student? ? 'pending' : 'approved'

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully created." }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1 or /enrollments/1.json
  def update
    @enrollment.status = current_user.student? ? 'pending' : 'approved'

    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully updated." }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1 or /enrollments/1.json
  def destroy
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: "Enrollment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.require(:enrollment).permit(:enrollment_date, :school_id, :course_id, :batch_id, :student_id, :status)
    end
end

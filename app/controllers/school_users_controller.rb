class SchoolUsersController < ApplicationController
  authorize_resource :class => false, :except => [:profile]
  before_action :set_user, only: %i[ show edit update destroy ]

  def new
    @user = User.new
  end

  def index
    @users = User.all_shool_admins
  end

  def profile
  end

  def edit
  end

  def show
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserRole.find_or_create_by(user_id: @user.id, role_id: Role.find_by(name: 'school_admin')&.id)

        format.html { redirect_to school_user_url(@user), notice: "School Admin User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to school_user_url(@user), notice: "School Admin User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to school_users_url, notice: "School Admin User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :school_id, :email, :dob, :gender, :phone_number, :street_address, :city, :state, :country, :pin_code, :active)
  end
end

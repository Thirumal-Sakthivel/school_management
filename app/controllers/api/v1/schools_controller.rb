class Api::V1::SchoolsController < Api::V1::BaseController
  before_action :authorize_request

  # GET /api/v1/schools
  def index
    render_successs(data: { 
                            schools: ActiveModelSerializers::SerializableResource.new(
                              School.all,
                              each_serializer: Api::SchoolSerializer
                            ).as_json
                          }, message: 'Success')
  end

  # POST /api/v1/schools
  def create
    school = School.new(school_params)

    if school.save
      created("School was successfully created.", school)
    else
      unprocessable_entity(school.errors)
    end
  end

  # GET /api/v1/schools/:id
  def update
    school = School.find(params[:id])
    if school.update(school_params)
      ok("School was successfully updated.")
    else
      unprocessable_entity(school.errors)
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def school_params
      params.require(:school).permit(:name, :email, :phone_number, :office_phone, :website, :description, :street_address, :city, :state, :country, :pin_code, :delivery_method, :facilities, :active)
    end
end

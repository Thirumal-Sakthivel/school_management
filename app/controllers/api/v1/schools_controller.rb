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
end

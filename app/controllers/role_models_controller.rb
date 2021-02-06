class RoleModelsController < ApplicationController
  def index
    @role_models = RoleModelRecord.all_role_models
  end

  def new
    @role_model = RoleModelRecord.new
  end

  def create
    RoleModelRecord.create(role_model_params)
  end

  def show
    @role_model = RoleModelRecord.find(params[:id])
  end

  def edit
    @role_model = RoleModelRecord.find(params[:id])
  end

  def update
    role_model = RoleModelRecord.find(params[:id])
    role_model.update(role_model_params)

    redirect_to "/role_models/show/#{params[:id]}"
  end

  private def role_model_params
    params.require(:role_model_record).permit(:title, :description, :good_point, :bad_point, :approach)
  end
end

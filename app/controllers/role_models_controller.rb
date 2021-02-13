class RoleModelsController < ApplicationController
  def index
    @role_models = RoleModelRecord.all_role_models
  end

  def new
    @role_model = RoleModelRecord.new
  end

  def create
    @role_model_record = RoleModelRecord.new(role_model_params.slice(:title, :description, :good_point, :bad_point, :approach))
    if @role_model_record.save
      @role_model_record.save_tags(role_model_params[:tag].split)
    end
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
    params.permit(:title, :tag, :description, :good_point, :bad_point, :approach)
  end
end

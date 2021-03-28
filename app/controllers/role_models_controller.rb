class RoleModelsController < ApplicationController
  def index
    @role_models = RoleModelRecord.all_role_models(params[:page], 10)
  end

  def new
    @role_model = RoleModelRecord.new
  end

  def create
    @role_model_record = RoleModelRecord.new(role_model_params.slice(:title, :description, :good_point, :bad_point, :approach))
    @role_model_record.user_id = @current_user.id
    if @role_model_record.save
      @role_model_record.save_tags(role_model_params[:tag].split(','))
    end

    redirect_to '/role_models'
  end

  def show
    @role_model = RoleModelRecord.find(params[:id])
  end

  def edit
    @role_model = RoleModelRecord.find(params[:id])
  end

  def update
    role_model = RoleModelRecord.find(params[:id])

    if role_model.update(title: role_model_params[:title],
                         description: role_model_params[:description],
                         good_point: role_model_params[:good_point],
                         bad_point: role_model_params[:bad_point],
                         approach: role_model_params[:approach])

      role_model.save_tags(role_model_params[:tag].split(','))
    end

    redirect_to "/role_models/#{params[:id]}"
  end

  private def role_model_params
    params.permit(:title, :tag, :description, :good_point, :bad_point, :approach, :authenticity_token, :commit)
  end
end

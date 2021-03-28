class HomesController < ApplicationController
  def top
    @role_models = RoleModelRecord.all_role_models(params[:page], 9)
  end
end

class UserProfilesController < ApplicationController
  def index
    @users = User.all
    @users = User.all
  end

  def show
    @user_profile = user_profile
  end

  def new
  end

  def create
    @user_plofile = UserProfile.new(user_id: current_user.id,
                                    name: user_profile_params[:name],
                                    introduction: user_profile_params[:introduction],
                                    image: user_profile_image,
                                    background_image: user_profile_background_image
                                    )
    if @user_plofile.save
      flash[:notice] = '作成しました。'
      redirect_to("/users/#{@current_user.id}")
    else
      flash[:notice] = '作成出来ませんでした。もう一度プロフィールを作成して下さい。'
      redirect_to("/users/#{@current_user.id}/new")
    end
  end

  def edit
    @user_profile = user_profile
  end

  def update
    @user_plofile = user_profile
    @user_plofile.name = user_profile_params[:name]
    @user_plofile.introduction = user_profile_params[:introduction]
    @user_plofile.image = user_profile_image if user_profile_params[:image]
    @user_plofile.background_image = user_profile_background_image if user_profile_params[:background_image]

    if @user_plofile.save
      flash[:notice] = '保存しました。'
      redirect_to("/user_profiles/#{@current_user.id}")
    else
      flash[:notice] = '保存出来ませんでした。もう一度プロフィールを作成して下さい。'
      redirect_to "/role_models/#{@current_user.id}/edit"
    end
  end

  private def user_profile_params
    params.require(:profile).permit(:id, :name, :introduction, :image, :background_image)
  end

  private def user_profile
    User.find_by(id: params.permit(:id)[:id]).user_profile
  end

  private def user_profile_image
    return unless user_profile_params[:image]

    if user_profile_params[:image].size > 2.megabyte
      flash[:notice] = '画像サイズは2MBまでです。'
      render('user_profiles/new')
    else
      File.binwrite("public/user_images/#{current_user.id}.jpg", user_profile_params[:image].read)
    end

    return "#{current_user.id}.jpg"
  end

  private def user_profile_background_image
    return unless user_profile_params[:background_image]

    if user_profile_params[:background_image].size > 2.megabyte
      flash[:notice] = '画像サイズは2MBまでです。'
      render('user_profiles/new')
    else
      File.binwrite("public/user_background_images/#{current_user.id}.jpg", user_profile_params[:background_image].read)
    end

    return "#{current_user.id}.jpg"
  end
end

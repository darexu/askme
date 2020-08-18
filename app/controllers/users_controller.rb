# Контроллер, управляющий пользователями. Должен уметь:
#
#   1. Показывать страницу пользователя
#   2. Создавать новых пользователей
#   3. Позволять пользователю редактировать свою страницу
#
class UsersController < ApplicationController

  before_action :load_user, except: [:index, :create, :new]
  before_action :authorize_user, except: [:index, :new, :create, :show]
  # Это действие отзывается, когда пользователь заходит по адресу /users
  def index
    @users = User.all
    @hashtags = Hashtag.with_questions
  end

  def new
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def create
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Пользователь успешно зарегестрирован!'
    else
      render 'new'
    end
  end

  def update
    @user = User.find params[:id]

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные обновлены'
    else
      render 'edit'
    end
  end

  def destroy
    session[:user_id] = nil
    @user.destroy

    redirect_to root_path, notice: 'Профиль удален.'
  end

  def edit
  end

  def show
    @questions = @user.questions.order(created_at: :desc)

    @new_question = @user.questions.build
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :username, :avatar_url, :header_color)
  end
end

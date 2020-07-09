class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Vadim',
      username: 'installero',
      avatar_url: 'https://cdn.iconscout.com/icon/free/png-512/avatar-370-456322.png'
    )
  end
end

# Контроллер, управляющий пользователями. Должен уметь:
#
#   1. Показывать страницу пользователя
#   2. Создавать новых пользователей
#   3. Позволять пользователю редактировать свою страницу
#
class UsersController < ApplicationController
  # Это действие отзывается, когда пользователь заходит по адресу /users
  def index
    # Мы создаем массив из двух болванок пользователей. Для создания фейковой
    # модели мы просто вызываем метод User.new, который создает модель, не
    # записывая её в базу.
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Vadim',
      username: 'installero'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('10.07.2020')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('10.07.2020')),
      Question.new(text: 'Какая погода?', created_at: Date.parse('10.07.2020')),
      Question.new(text: 'Где деньги?', created_at: Date.parse('10.07.2020')),
      Question.new(text: 'Мелочь есть?', created_at: Date.parse('10.07.2020')),
      Question.new(text: 'Как пройти в библиотеку?', created_at: Date.parse('10.07.2020'))
    ]

    @new_question = Question.new
  end
end

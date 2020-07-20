class Question < ApplicationRecord
  belongs_to :user
  # optional: true дает возможность сохранить вопрос без автора
  belongs_to :author, class_name: 'User', optional: true

  #начиная с 5 рельс связь belongs_to добавляет validates :user, presence: true автоматически
  validates :text, presence: true
  validates :text, length: { maximum: 255 }
end

class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User'

  #начиная с 5 рельс связь belongs_to добавляет validates :user, presence: true автоматически
  validates :text, presence: true
  validates :text, length: { maximum: 255 }

end

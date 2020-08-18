class Question < ApplicationRecord
  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions

  belongs_to :user
  # optional: true дает возможность сохранить вопрос без автора
  belongs_to :author, class_name: 'User', optional: true

  #начиная с 5 рельс связь belongs_to добавляет validates :user, presence: true автоматически
  validates :text, presence: true
  validates :text, length: { maximum: 255 }

  after_save_commit :create_hashtags

  private

  def create_hashtags
    self.hashtags =
      "#{answer} #{text}".
        downcase.
        scan(Hashtag::REGEXP).
        uniq.
        map { |ht| Hashtag.find_or_create_by(text: ht.delete('#')) }
  end
end

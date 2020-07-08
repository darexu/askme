require 'openssl'

class User < ApplicationRecord
  # параметры работы модуля шифрофания паролей
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  attr_accessor :password, :email

  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, on: :create
  validates :username, format: { with: /\A[a-zA-Z0-9_]+\z/}, length: { maximum: 40 }, on: :create
  validates :password, presence: true, on: :create
  validates :password, confirmation: true

  before_validation :downcase_username
  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      # создаем т. н. "соль" - рандомная строка усложняющая задачу хакерам
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      # создаем хэш пароля - длинная уникальная строка, из которой невозможно восстановить
      # исходный пароль
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS,  DIGEST.length, DIGEST)
      )
    end
  end

  # служебный метод, преобразующий бинарную строку в 16-ричный формат, для удобства хранения
  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email) # сперва находим кандидата по email

    # Сравнивается password_hash, а оригинальный парал так никогда и не сохраняется
    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS,  DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  private
    def downcase_username
      self.username = self.username.downcase
    end
  
end

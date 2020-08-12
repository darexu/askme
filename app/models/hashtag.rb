class Hashtag < ApplicationRecord
  validatates :text, presence: true, uniqueness: true
end
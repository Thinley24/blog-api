class Article < ApplicationRecord
    include Visible

    #Active Record Association ==> one-to-many
    has_many :comments, dependent: :destroy # dependent -- allows to delete all the comments associated with an article when it is deleted

    #adding validation to validate user input
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end

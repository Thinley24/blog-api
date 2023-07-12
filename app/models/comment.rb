class Comment < ApplicationRecord
  include Visible

  #an Active Record association
  belongs_to :article #one-to-one
end

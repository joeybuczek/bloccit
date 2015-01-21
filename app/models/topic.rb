require_relative "../../lib/paginate"

class Topic < ActiveRecord::Base
  extend Paginate
  has_many :posts
end

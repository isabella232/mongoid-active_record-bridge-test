require 'active_record/associations/mongoid_adapter'

class Mook < ActiveRecord::Base
  include ActiveRecord::Associations::MongoidAdapter

  belongs_to_document :boss
end

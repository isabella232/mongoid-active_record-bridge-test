require 'mongoid/relations/active_record_adapter'

class Boss
  include Mongoid::Document
  include Mongoid::Relations::ActiveRecordAdapter

  field :name,     :type => String
  field :nickname, :type => String

  field :hit_points, :type => Integer

  field :special_attacks, :type => Array

  has_many_documents :mooks
end

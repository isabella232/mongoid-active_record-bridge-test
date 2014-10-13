class Boss
  include Mongoid::Document

  field :name,     :type => String
  field :nickname, :type => String

  field :hit_points, :type => Integer

  field :special_attacks, :type => Array
end

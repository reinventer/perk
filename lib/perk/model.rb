require 'active_record'

module Perk
  class Model < ActiveRecord::Base
    self.abstract_class = true
  end
end

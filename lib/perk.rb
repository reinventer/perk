require 'perk/version'
require 'perk/model'
require 'perk/visit'
require 'perk/dictionaries'

module Perk
  class << self
    def visits(start_time, end_time = Time.now)
      Visit.where("visits.created_at between ? and ?", start_time, end_time).
        includes(*%i(session ip url_domain url_path url_query_string referer_domain referer_path referer_query_string user_agent))
    end
  end
end

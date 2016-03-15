module Perk
  class Visit < Model
    belongs_to :session
    belongs_to :ip

    belongs_to :url_domain,       foreign_key: 'url_domain_id',       class_name: 'Perk::Domain'
    belongs_to :url_path,         foreign_key: 'url_path_id',         class_name: 'Perk::Path'
    belongs_to :url_query_string, foreign_key: 'url_query_string_id', class_name: 'Perk::QueryString'

    belongs_to :referer_domain,       foreign_key: 'url_domain_id',       class_name: 'Perk::Domain'
    belongs_to :referer_path,         foreign_key: 'url_path_id',         class_name: 'Perk::Path'
    belongs_to :referer_query_string, foreign_key: 'url_query_string_id', class_name: 'Perk::QueryString'

    belongs_to :user_agent

    def url
      c = url_https? ? URI::HTTPS : URI::HTTP
      c.build(
        host:  url_domain.value,
        path:  url_path.value,
        query: url_query_string && url_query_string.value
      )
    end

    def referer
      if referer_domain
        c = referer_https? ? URI::HTTPS : URI::HTTP
        c.build(
          host:  referer_domain.value,
          path:  referer_path.value,
          query: referer_query_string && referer_query_string.value
        )
      end
    end
  end
end

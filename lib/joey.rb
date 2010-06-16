module Joey
end

require 'hashie'
require 'koala'

require 'joey/rest_api'
require 'joey/fetching_array'
require 'joey/profile'
require 'joey/user'

Koala::Facebook::GraphAndRestAPI.send(:include, Joey::RestAPI)

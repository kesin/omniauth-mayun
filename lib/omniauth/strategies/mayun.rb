require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Mayun < OmniAuth::Strategies::OAuth2
      option :client_options, {
          :site => 'http://git.net',
          :authorize_url => '/oauth/authorize',
          :token_url => '/oauth/token',
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
              # to support omniauth-oauth2's auto csrf protection
              session['omniauth.state'] = params[:state] if v == 'state'
            end
          end
        end
      end

      uid { raw_info['id'].to_s }

      info do
        {
            'nickname' => raw_info['name'],
            'email' => raw_info['email'],
            'name' => raw_info['name'],
            'avatar' => raw_info['avatar_url'],
            'blog' => raw_info['blog'],
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
	      access_token.options[:param_name] = 'access_token'
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/api/v5/user').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'mayun', 'Mayun'

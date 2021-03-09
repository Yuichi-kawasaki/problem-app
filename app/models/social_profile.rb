class SocialProfile < ApplicationRecord
    belongs_to :user
    store      :others
    validates_uniqueness_of :uid, scope: :provider


    scope :search_with_providers, ->(provider) { where(provider: provider) }
    def set_values(omniauth)
        return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']
        credentials = omniauth['credentials']
        info = omniauth['info']
        self.access_token = credentials['token']
        # self.access_secret = credentials['secret']
        self.credentials = credentials.to_json
        self.email = info['email']
        self.name = info['name']
        # self.nickname = info['nickname']
        # self.description = info['description'].try(:truncate, 255)
        self.image_url = info['image']
        case provider.to_s

        when 'google'
              self.nickname ||= info['email'].sub(/(.+)@gmail.com/, '\1')
        when 'facebook'
          # self.url = info['url']['facebook']
        end

        self.set_values_by_raw_info(omniauth['extra']['raw_info'])
    end

      def set_values_by_raw_info(raw_info)
        case provider.to_s
        when 'google'
          self.url = raw_info['link']
        end

        self.raw_info = raw_info.to_json
        self.save!
      end
    end

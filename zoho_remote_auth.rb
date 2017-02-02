module Zoho
  class RemoteAuth
    TOKEN = 'yourtoken'
    BASIC_URL = "http://yourpage.com/support/RemoteAuth?"
    attr_accessor :email ,:loginname, :fullname ,:utype ,:role ,:profile , :redirect

    def initialize(attributes)
      attributes.each {|key, value| self.send(("#{key}="), value)}
    end

    def get_sign_up_url
      init_ts
      get_url(get_fields_sign_up_url)
    end

    def get_sign_in_url
      init_ts
      get_url(get_fields_sign_in_url)
    end

    private
    def init_ts
      @ts = DateTime.now.strftime('%Q')
    end

    def get_url(fields)
      fields_query = fields_to_query(fields)
      url = BASIC_URL + fields_query.to_query
    end

    def get_apikey(fields)
      Digest::MD5.hexdigest(get_digest_string(fields))
    end

    def get_digest_string(fields)
      fields.compact.map{|k,v| "#{v}"}.join('')
    end

    def fields_to_query(fields)
      Hash[ fields.compactr.collect {|k,v| [k, URI.encode(v.to_s)] } ]
    end

    def get_fields_sign_up_url
      operation = "signup"
      apikey_fields =
          {
              operation:operation,
              email:email,
              loginname:loginname,
              fullname:fullname,
              utype:utype,
              role:role,
              profile:profile,
              remoteauthkey:TOKEN,
              ts:@ts
          }
      fields =
          {
              operation:operation,
              email:email,
              ts:@ts,
              loginname:loginname,
              fullname:fullname,
              utype:utype,
              role:role,
              profile:profile,
              apikey:get_apikey(fields_to_query(apikey_fields)),
              redirect:redirect
          }
    end

    def get_fields_sign_in_url
      operation = "signin"
      apikey_fields =
          {
              operation:operation,
              email:email,
              remoteauthkey:TOKEN,
              ts:@ts
          }
      fields =
          {
              operation:operation,
              email:email,
              ts:@ts,
              apikey:get_apikey(fields_to_query(apikey_fields))
          }
    end
  end
end
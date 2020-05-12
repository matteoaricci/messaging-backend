class ApplicationController < ActionController::API
    def key
        Rails.application.secrets.secret_key_base
    end

    def encode(payload)
        JWT.encode(payload, key, "HS256")
    end

    def decode(token)
        JWT.decode(token, key, true, {algorithm: "HS256"})
    end
end

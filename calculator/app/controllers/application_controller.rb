class ApplicationController < ActionController::Base
    # InvalidAuthenticityToken 무효화(임시)
    skip_before_action :verify_authenticity_token, raise: false
end

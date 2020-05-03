class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken, Pundit
end

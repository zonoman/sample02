module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id 
        #railsで事前定義済みのsessionメソッドに、ユーザーIDを記憶させる。
        #このコードは自動的に暗号化されて、保護される
    end

    def current_user
        if session[:user_id]
          @current_user = @current_user || User.find_by(id:session[:user_id])
        end
      end

    def logged_in?
        !current_user.nil?
    end

    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
    

end

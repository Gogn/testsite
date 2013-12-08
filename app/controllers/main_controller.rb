class MainController < ApplicationController

before_filter :check_login, only: [:test] #Проверяем аутентифицировался ли пользователь через метод before_filter
before_filter :find_user, only: [:test, :nextquest] 

  def home
     if session[:user_id] #Вадидация активности сессии
            @n = 1   
     else
            flash.now[:error] = "Please, authentication"
            @n = 0
     end
  end

  def help
  end

  def test
 		 unless @id
				 		@id = 1
		 end
 
    @quests = Quest.find(@id)
  end

  def nextquest
	 @id =	params[:id].to_i

   @quests = Quest.find(@id)

 	if (params[:answer]) == @quests.truequest
             @user.increment!(:result)
	end
	
	if (params[:answer])
					@id += 1
  end
   @quests = Quest.find(@id)
    render "test"
  end

  def result
  end

  def login
   @user = User.find_by_name(params[:name])  
   @password = User.find_by_password(params[:password]) 
  if @user and @password  #Валидация, если пользователь найден, то:
            session[:user_id] = @user.id
            session[:name] = @user.name
            @name = @user.name
            flash[:success] = "Hello, #{@name}, your session is active! =)" #метод flash определен в app/views/layouts
            redirect_to main_home_url
   else #Если пользователь не найден:
            flash.now[:error] = "PLEASE, ENTER CORRECT PASSWORD AND LOGIN!!!" #метод flash определен в app/views/layouts. .now только для текущего действия
            render "login"
   end
session
 end



  def logout
  session[:user_id] = 0
    session.clear
    redirect_to main_home_url
  end

 private
 
def check_login
   unless session[:user_id] 
      redirect_to main_login_url
   end
end

def find_user
      @user = User.find_by_name(session[:name])
end

end

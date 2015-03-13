class UsersController < ApplicationController
  respond_to :json, :html

  def index
    @users = User.all 
    respond_with @users
  end
  def new
    @user = User.new
  end

  def show
    
     
    @user = User.find(params[:id])
    @weather = HTTParty.get('http://api.openweathermap.org/data/2.5/forecast?q=Santa_monica,ca&mode=JSON').parsed_response["list"]
    if @weather
        @weathers = Array.new
        i = 0
       while i <= 5 do 
          @weathers.push(@weather[i]["weather"][0]["main"])
         i +=1
       end
       if @weathers.include? 'rain'
          @forecast = "Looks like rain!"
        else
          @forecast = "Clear skies! Happy driving!"
        end
        # format.html # show.html.erb
         respond_with @user 
    else
      @weather = "Our weatherman is out to lunch"
      @weathers = "Our weatherman is out to lunch"
    end
  end
    
  def edit
    @user = User.find(params[:id])
    if current_user == nil
      redirect_to new_sessions_path
    end
    if current_user.id != @user.id
      redirect_to edit_user_path(current_user)
    end
  end

   def update
     user = User.find(params[:id])
    # respond_to do |format|
      if current_user.update(user_params) #could also use update_attributes method
        #format.html { redirect_to @user, notice: 'user was successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
        redirect_to user
      else
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    # end
  end


  def create 

    user = User.new((user_params).merge(password:'12345'))
    
    #respond_to do |format|
      if user.save
        session["user_id"]=user.id.to_s
          #UserMailer.welcome(user).deliver_now
          redirect_to edit_user_path(user)
        #format.html { redirect_to @user, notice: 'user was successfully created.' }
        #format.json { render :show, status: :created, location: @order }
      else
        redirect_to new_user_path
        #format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    #end
  end

private 
  def set_user
      @user = User.find(params[:id])
  end

  def user_params
   params.require(:user).permit(:email, :avatar, :first_name, :last_name, :street_address, :city, :state, :zip, :phone)
  end
end

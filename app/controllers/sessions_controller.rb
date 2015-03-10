class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
    # Find the user by email. The .where brings back a collection. The .first gives us the first one in that collection of users with that email. In the future, we'd set up our tables to accept only unique emails, so we'd not need the .first.
    user = User.where(email: params[:user][:email]).first
    owner = Owner.where(email: params[:owner][:email]).first
    pilot = Pilot.where(email: params[:pilot][:email]).first
    if (user !=nil || owner !=nil || pilot !=nil) &&\
       (user.authenticate(params[:user][:password])|| \
       owner.authenticate(params[:owner][:password]) || \
        pilot.authenticate(params[:pilot][:password])) #this returns the object and is truthy, if correct password supplied
           
           

      session["user_id"] ||= user.id.to_s #converts user ID to a string. 
      redirect_to user #this is where we specify what we want a valid login to redirect to

      # session["owner_id"] ||= owner.id.to_s
      # redirect_to owner

      # session["pilot_id"] ||= pilot.id.to_s
      # redirect_to pilot
    
    else
      redirect_to new_sessions_path
      end
  end

  def destroy
      session.destroy
      redirect_to new_sessions_path
  end
end

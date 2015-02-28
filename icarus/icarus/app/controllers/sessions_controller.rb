class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
    # Find the user by email. The .where brings back a collection. The .first gives us the first one in that collection of users with that email. In the future, we'd set up our tables to accept only unique emails, so we'd not need the .first.
    u = User.where(email: params[:user][:email]).first
    if u !=nil && u.authenticate(params[:user][:password]) #this returns the object and is truthy, if correct password supplied
      session["user_id"] = u.id.to_s #converts user ID to a string. 
      redirect_to u #this is where we specify what we want a valid login to redirect to
    
    else
      redirect_to new_sessions_path
      end
  end

  def destroy
      session.destroy
      redirect_to new_sessions_path
  end
end

class OwnersController < ApplicationController
  def index
    @owners = Owner.all 
  end
  def new
    @owner = Owner.new
  end

  def show
    @owner = Owner.find(params[:id])
  end
    
  def edit
    @owner = Owner.find(params[:id])
    if current_owner == nil
      redirect_to new_sessions_path
    end
    if current_owner.id != @owner.id
      redirect_to edit_owner_path(current_owner)
    end
  end

   def update
     owner = Owner.find(params[:id])
    # respond_to do |format|
      if current_owner.update(owner_params) #could also use update_attributes method
        #format.html { redirect_to @owner, notice: 'owner was successfully updated.' }
        #format.json { render :show, status: :ok, location: @owner }
        redirect_to owner
      else
        #format.html { render :edit }
        #format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    # end
  end


  def create 

    owner = Owner.new((params.require(:owner).permit(:email, :first_name, :last_name)).merge(password:'12345'))
    
    #respond_to do |format|
      if Owner.save
        session["owner_id"]=Owner.id.to_s
          #ownerMailer.welcome(owner).deliver_now
          redirect_to edit_owner_path(owner)
        #format.html { redirect_to @owner, notice: 'owner was successfully created.' }
        #format.json { render :show, status: :created, location: @order }
      else
        redirect_to new_owner_path
        #format.html { render :new }
        #format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    #end
  end

private 
  def set_owner
      @owner = Owner.find(params[:id])
  end

  def owner_params
   params.require(:owner).permit(:email, :avatar)
  end
end

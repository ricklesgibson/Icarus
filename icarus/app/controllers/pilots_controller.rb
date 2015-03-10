class PilotsController < ApplicationController
   def index
    @pilots = Pilot.all 
  end
  def new
    @pilot = Pilot.new
  end

  def show
    @pilot = Pilot.find(params[:id])
  end
    
  def edit
    @pilot = Pilot.find(params[:id])
    if current_pilot == nil
      redirect_to new_sessions_path
    end
    if current_pilot.id != @pilot.id
      redirect_to edit_pilot_path(current_pilot)
    end
  end

   def update
     pilot = Pilot.find(params[:id])
    # respond_to do |format|
      if current_pilot.update(pilot_params) #could also use update_attributes method
        #format.html { redirect_to @pilot, notice: 'pilot was successfully updated.' }
        #format.json { render :show, status: :ok, location: @pilot }
        redirect_to pilot
      else
        #format.html { render :edit }
        #format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    # end
  end


  def create 

    pilot = Pilot.new((params.require(:pilot).permit(:email, :first_name, :last_name)).merge(password:'12345'))
    
    #respond_to do |format|
      if Pilot.save
        session["pilot_id"]=Pilot.id.to_s
          #pilotMailer.welcome(pilot).deliver_now
          redirect_to edit_pilot_path(pilot)
        #format.html { redirect_to @pilot, notice: 'pilot was successfully created.' }
        #format.json { render :show, status: :created, location: @order }
      else
        redirect_to new_pilot_path
        #format.html { render :new }
        #format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    #end
  end

private 
  def set_pilot
      @pilot = Pilot.find(params[:id])
  end

  def pilot_params
   params.require(:pilot).permit(:email, :avatar)
  end
end
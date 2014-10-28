class PlaylistsController < ApplicationController


  skip_before_filter :verify_authenticity_token,
                :if => Proc.new { |c| c.request.format == 'application/json' }
  
  respond_to :json


	def index
      playlists = current_user.playlists
      # playlists = playlists.map{|event|
      #   eventJSON = event.as_json
      #   participants = event.users;
      #   eventJSON['participants'] = participants
      #   eventJSON
      # }
      render :status => 200,
         :json => { success: true,
           playlists: playlists
        }
    end

	  def create
	     event = Event.create(params.permit(:name, :description, :start_time, :latitude, :longitude, :address))
	     friend_array = []
	     
	     params[:participants].each do |participant|
	        friend = User.find(participant['id'])
	        if(friend) 
	          friend_array.push(friend)
	        else
	           render :status => 400,
	           :json => { success: false,
	             friend_id_not_found: friend_id}
	        end
	     end
	     event.users = friend_array.push(current_user)

	     if (event.save)
	       eventJSON = event.as_json;
	       participants = event.users;
	       eventJSON['participants'] = participants

	       render :status => 200,
	         :json => { success: true,
	                     event: eventJSON}
	        
	     else
	         render :status => 400,
	         :json => { success: false,
	          error: event.errors}
	        
	     end
	  end

end

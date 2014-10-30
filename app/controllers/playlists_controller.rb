class PlaylistsController < ApplicationController

 # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!

  # This is Devise's authentication
  before_filter :authenticate_user!
  
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
	     playlist = Playlist.create(params.permit(:name, :description))
	     users = playlist.users
	     if(!users)
	      	users = []
	     end
	     users.push(current_user)
	     playlist.users = users
	     if (playlist.save)
	       playlistJSON = playlist.as_json;
	       participants = playlist.users;
	       playlistJSON['users'] = participants

	       render :status => 200,
	         :json => { success: true,
	                     playlist: playlistJSON}
	        
	     else
	         render :status => 400,
	         :json => { success: false,
	          error: playlist.errors}
	        
	     end
	  end

end

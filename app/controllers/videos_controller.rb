class VideosController < ApplicationController

 # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!

  # This is Devise's authentication
  before_filter :authenticate_user!
  
  skip_before_filter :verify_authenticity_token,
                :if => Proc.new { |c| c.request.format == 'application/json' }
  
  respond_to :json


	def index
      videos = current_user.playlists
      # playlists = playlists.map{|event|
      #   eventJSON = event.as_json
      #   participants = event.users;
      #   eventJSON['participants'] = participants
      #   eventJSON
      # }
      render :status => 200,
         :json => { success: true,
           videos: videos
        }
  end

  def show
      playlist = Playlist.find(params[:id])
      if(playlist)
       render :status => 200,
         :json => { success: true,
                     songs: playlist.videos}
      else
        render :status => 400,
         :json => { success: false,
          error: "Not Found"}
      end
  end

  def create

     video = Video.create(params.permit(:name, :description, :playlist_id, :video_type, :source_id))
    
     if (video.save)

       render :status => 200,
         :json => { success: true,
                     video: video}
        
     else
         render :status => 400,
         :json => { success: false,
          error: video.errors}
        
     end
  end

end

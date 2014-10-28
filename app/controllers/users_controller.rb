class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token,
                :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def index 
  	render :status => 200,
  		   :json => request.body

  	# render :status => 200,
   #         :json => { :success => true,
   #                    :users => { users_in_contact }

  end
end
class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token,
                :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    build_resource sign_up_params
    if resource.save
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :user => resource} }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors,
                        :data => {} }
    end
  end

  def index 
  	render :status => 200,
  		   :json => request.body

  	# render :status => 200,
   #         :json => { :success => true,
   #                    :users => { users_in_contact }

  end
end
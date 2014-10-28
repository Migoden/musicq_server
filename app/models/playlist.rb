class Playlist < ActiveRecord::Base
  
  has_many :playlist_user
  has_many :users, :through => :playlist_user

  #   def as_json(options={})
  #   	 json = super(:start_time => self.start_time.to_time.to_i)
  #   	 json['start_time'] = self.start_time.to_time.to_i
  #   	 json
  # end

  
  scope :with_participant, lambda { |user| 
            includes(:producer).where('users.id LIKE ?', "%#{user.id}%") }

end

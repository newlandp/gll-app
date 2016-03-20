class Goal < ActiveRecord::Base
    has_many :tracks, dependent: :destroy
    has_many :days, dependent: :destroy
    has_many :users, through: :tracks
end

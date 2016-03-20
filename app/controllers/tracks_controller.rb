class TracksController < ApplicationController
    
    before_action :require_signin
    before_action :get_user
    
    def index
        @tracks = @user.tracks
    end
    
    def show
        @track = @user.tracks.find(params[:id])
        @goal = @track.goal
        @progress = @track.percent_complete
        @days = @track.days
    end
    
    def filtered_days
        @track = @user.tracks.find(params[:id])
        @goal = @track.goal
        @progress = @track.percent_complete
        
        case params[:filter]
        when "upcoming"
            @days = @track.upcoming_days
            @key = "upcoming"
            @day = nil
        when "completed"
            @days = @track.completed_day_objects
            @key = "completed"
            @day = nil
        when "current"
            @day = @track.current_day_object
            @key = "current"
        end
    end
    
    def new
        @track = @user.tracks.new
    end
    
    def edit
        
    end
    
    def update
        @track = @user.tracks.find(params[:id])
        case params[:method]
        when "add"
            before = @track.current_day
            @track.complete_day
            redirect_to filtered_days_path(@user.id, @track.id, "current"), notice: "You completed day #{before}!"
        end
    end
    
    def create
        @track = @user.tracks.new(current_day: 1, days_completed: "")
        @track.goal = Goal.find(params["track"][:goal_id])
        @track.save
        redirect_to user_tracks_path(@user.id), notice: "You just added track: #{@track.goal.name}"
    end
    
    def destroy
        @track = @user.tracks.find(params[:id])
        @track.destroy
        redirect_to user_tracks_path(@user.id), alert: "Track successfully deleted!"
    end
    
private

    def get_user
        @user = current_user
    end
    
end

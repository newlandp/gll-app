class DaysController < ApplicationController
    
    before_action :require_signin
    before_action :require_admin, except: [:index, :show]
    
    def index
        @goal = Goal.find params[:goal_id]
        @days = @goal.days
    end
    
    def show
        @goal = Goal.find params[:goal_id]
        @day = @goal.days.find(params[:id])
    end
    
    def new
        @goal = Goal.find params[:goal_id]
        @day = @goal.days.new
    end
    
    def create
        @goal = Goal.find params[:goal_id]
        @day = @goal.days.new(day_params)
        @day.save
        redirect_to goal_days_path(@goal.id), notice: "Day #{@day.number} for #{@goal.name} successfully created!"
    end
    
    def edit
        @goal = Goal.find params[:goal_id]
        @day = @goal.days.find(params[:id])
    end
    
    def update
        @goal = Goal.find params[:goal_id]
        @day = @goal.days.find(params[:id])
        @day.update(day_params)
        redirect_to goal_day_path(@goal.id, @day.id), notice: "Day #{@day.number} for #{@goal.name} successfully updated!"
    end
    
    def destroy
        @goal = Goal.find params[:goal_id]
        @day = @goal.days.find(params[:id])
        @day.destroy
        redirect_to goal_path(@goal.id), alert: "Day successfully deleted"
    end
    
private
    
    def day_params
        params.require(:day).permit(:number, :description, :name)
    end
    
end

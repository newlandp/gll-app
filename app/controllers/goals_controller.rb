class GoalsController < ApplicationController
    
    before_action :require_signin
    before_action :require_admin, except: [:index, :show]
    
    def index
        @goals = Goal.all
    end
    
    def show
        @goal = Goal.find(params[:id])
        @user = current_user
        @track = current_user.tracks.new
    end
    
    def new
        @goal = Goal.new
    end
    
    def create
        @goal = Goal.new(goal_params)
        @goal.save
        redirect_to goal_path(@goal.id), notice: "#{@goal.name} successfully created!"
    end
    
    def edit
        @goal = Goal.find(params[:id])
    end
    
    def update
        @goal = Goal.find(params[:id])
        @goal.update(goal_params)
        redirect_to goal_path(@goal.id), notice: "#{@goal.name} successfully updated!"
    end
    
    def destroy
        @goal = Goal.find(params[:id])
        @goal.destroy
        redirect_to goals_path, alert: "Goal successfully deleted!"
    end
    
private
    
    def goal_params
        params.require(:goal).permit(:name, :description)
    end
    
end

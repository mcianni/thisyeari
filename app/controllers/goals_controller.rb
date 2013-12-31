class GoalsController < ApplicationController
  before_filter :save_goal_in_session, only: [:create]
  before_filter :authenticate_user!
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /my-goal
  def show
    if @goal
      time = Time.now
      qpd = @goal.quantity / 365
      @q_by_today    = qpd * (time.yday - 1)
      @q_by_tomorrow = qpd * time.yday
      @q_by_month    = qpd * Date.new(time.year, time.month - 1).yday
      @q_by_week     = qpd * (time.yday + (7 - time.wday - 1))
      @points = @goal.points
    end
  end

  # GET /goals/new
  def new
    if current_user.goal
      redirect_to :goals, notice: "You've already created your goal!"
    else
      if session[:goal]
        @goal = Goal.new(description: session.delete(:goal), user_id: current_user.id)
        if @goal.save
          redirect_to goals_path
        else
          render action: 'new'
        end
      else
        @goal = Goal.new
      end
    end
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = current_user.goals.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to :goals, notice: 'Goal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @goal }
      else
        format.html { render action: 'new' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to :goals, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to :goals }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = current_user.goal
    end

    def save_goal_in_session
      session[:goal] = params[:goal][:description]
    end

    def verify_user
      redirect_to '/' unless current_user?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:description, :quantity)
    end
end

class PomodorosController < ApplicationController
  before_action :set_pomodoro, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :create

  # GET /pomodoros
  # GET /pomodoros.json
  def index
    @pomodoros = Pomodoro.all

    h = Pomodoro.group(:task).count
    @pie_chart = {}
    @multiple_lines = {}

    h.each do |k,v|
      @pie_chart[k.name] = v
    end

    @multiple_lines['name'] = Task.all.order(:created_at)
    @multiple_lines['data'] = Pomodoro.all.group_by_hour_of_day(:created_at).count
  end

  # GET /pomodoros/1
  # GET /pomodoros/1.json
  def show
  end

  # GET /pomodoros/new
  def new
    @pomodoro = Pomodoro.new
  end

  # GET /pomodoros/1/edit
  def edit
  end

  # POST /pomodoros
  # POST /pomodoros.json
  def create
    @pomodoro = Pomodoro.new(pomodoro_params)

    current_user = User.find(Timer.find_by_token(params[:token]).user_id)
    current_task = current_user.tasks.current ||
                   Task.find_by_name('Nameless activity') ||
                   Task.unnamed(current_user.id)

    @pomodoro.update_attribute(:task_id, current_task.id)

    respond_to do |format|
      if @pomodoro.save
        format.html { redirect_to @pomodoro, notice: 'Pomodoro was successfully created.' }
        format.json { render :show, status: :created, location: @pomodoro }
      else
        format.html { render :new }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pomodoros/1
  # PATCH/PUT /pomodoros/1.json
  def update
    respond_to do |format|
      if @pomodoro.update(pomodoro_params)
        format.html { redirect_to @pomodoro, notice: 'Pomodoro was successfully updated.' }
        format.json { render :show, status: :ok, location: @pomodoro }
      else
        format.html { render :edit }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pomodoros/1
  # DELETE /pomodoros/1.json
  def destroy
    @pomodoro.destroy
    respond_to do |format|
      format.html { redirect_to pomodoros_url, notice: 'Pomodoro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pomodoro
      @pomodoro = Pomodoro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pomodoro_params
      params.permit(:duration, :task_id)
    end
end

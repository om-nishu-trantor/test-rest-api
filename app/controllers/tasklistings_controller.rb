class TasklistingsController < ApplicationController
  before_action :set_tasklisting, only: [:show, :edit, :update, :destroy]

  # GET /tasklistings
  # GET /tasklistings.json
  def index
    @tasklistings = Tasklisting.all
  end

  # GET /tasklistings/1
  # GET /tasklistings/1.json
  def show
  end

  # GET /tasklistings/new
  def new
    @tasklisting = Tasklisting.new
  end

  # GET /tasklistings/1/edit
  def edit
  end

  # POST /tasklistings
  # POST /tasklistings.json
  def create
    @tasklisting = Tasklisting.new(tasklisting_params)

    respond_to do |format|
      if @tasklisting.save
        format.html { redirect_to @tasklisting, notice: 'Tasklisting was successfully created.' }
        format.json { render :show, status: :created, location: @tasklisting }
      else
        format.html { render :new }
        format.json { render json: @tasklisting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasklistings/1
  # PATCH/PUT /tasklistings/1.json
  def update
    respond_to do |format|
      if @tasklisting.update(tasklisting_params)
        format.html { redirect_to @tasklisting, notice: 'Tasklisting was successfully updated.' }
        format.json { render :show, status: :ok, location: @tasklisting }
      else
        format.html { render :edit }
        format.json { render json: @tasklisting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasklistings/1
  # DELETE /tasklistings/1.json
  def destroy
    @tasklisting.destroy
    respond_to do |format|
      format.html { redirect_to tasklistings_url, notice: 'Tasklisting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasklisting
      @tasklisting = Tasklisting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tasklisting_params
      params.require(:tasklisting).permit(:name, :count)
    end
end

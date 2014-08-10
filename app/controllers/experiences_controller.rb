class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  end

  def search
    render json: {param: params[:keyword]}
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.project_id ||= params[:project_id]

    respond_to do |format|
      if @experience.save
        format.js
      else
        format.js { render js: 'alert("Something went wrong")' }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      format.js
    end
  end

  def destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:project_id, :skill_id, :person_id, :rate, :days, :description)
    end
end

class RecruitsController < ApplicationController
  before_action :set_recruit, only: %i[show edit update destroy]

  before_action :authenticate_user!, except: %i[index show]

  def index
    @recruits = Recruit.all.order('created_at DESC')

    @recruit = Recruit.new
  end

  def show; end

  def new
    @recruit = current_user.recruits.build
  end

  def edit
    @recruit = Recruit.find(params[:id])
  end

  def create
    @recruit = Recruit.new(recruit_params)
    @recruit.user_id = current_user.id
    if @recruit.save
      flash[:notice] = 'Recruit was successfully created'
      redirect_to recruits_path(@recruit)
    else
      render 'new'
    end
  end

  def update
    @recruit = Recruit.find(params[:id])
    if @recruit.update(recruit_params)
      flash[:notice] = 'Recruit was successfully updated'
      redirect_to recruit_path(@recruit)
    else
      render 'edit'
    end
  end

  def destroy
    @recruit.destroy

    respond_to do |format|
      format.html { redirect_to recruits_url, notice: 'Recruit was successfully destroyed.' }

      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def recruit_params
    params.require(:recruit).permit(:recruit)
  end
end

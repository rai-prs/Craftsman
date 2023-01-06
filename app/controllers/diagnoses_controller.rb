class DiagnosesController < ApplicationController

 def index
 end

  def new
    @diagnosis = Diagnosis.new(user_id: current_user.id)
  end

  def show
    @diagnosis = current_user.diagnoses.find(params[:id])
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    if @diagnosis.save
      flash[:notice] = "診断が完了しました"
      redirect_to diagnosis_path(@diagnosis.id)
    else
      flash[:notice] = "診断出来ませんでした"
      redirect_to :action => "new"
    end
  end

  def diagnosis_params
    params.require(:diagnosis).permit(:id, :communication, :planning, :dexterous, :tidy, :physically, :muscle, :intelligence, :careful, :pride, :picky, :narrow, :dirt, :destruction, :high, :user_id)
  end
end

class DiagnosesController < ApplicationController
  def new
    @diagnosis = Diagonosis.new
  end

  def show
    @diagnosis = Diagonosis.find_by(id: params[:id])
  end

  def create
    @diagnosis = Diagonosis.new(diagnosis_params)
    if @diagnosis.save
      flash[:notice] = "診断が完了しました"
      redirect_to diagonosis_path(@diagnosis.id)
    else
      redirect_to :action => "new"
    end
  end

  def diagnosis_params
    params.require(:diagonosis).permit(:id, :communication, :planning, :dexterous, :tidy, :physically, :muscle, :intelligence, :careful, :pride, :picky, :narrow, :dirt, :destruction, :high)
  end
end

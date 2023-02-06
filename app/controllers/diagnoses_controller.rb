class DiagnosesController < ApplicationController

 def index
 end

  def new
    @diagnosis = Diagnosis.new(user_id: current_user.id)
  end

  def show
    @diagnosis = current_user.diagnoses.find(params[:id])
    @craftsmanship = (@diagnosis.communication.to_i + @diagnosis.planning.to_i + @diagnosis.dexterous.to_i + @diagnosis.tidy.to_i + @diagnosis.physically.to_i + @diagnosis.muscle.to_i + @diagnosis.intelligence.to_i + @diagnosis.pride.to_i + @diagnosis.picky.to_i) * 2.4 - @diagnosis.destruction.to_i * 3 - @diagnosis.narrow.to_i - @diagnosis.dirt.to_i - @diagnosis.high.to_i - @diagnosis.careful.to_i * 2
    gon.communication = @diagnosis.communication
    gon.planning = @diagnosis.planning
    gon.dexterous = @diagnosis.dexterous
    gon.tidy = @diagnosis.tidy
    gon.physically = @diagnosis.physically
    gon.muscle = @diagnosis.muscle
    gon.intelligence = @diagnosis.intelligence
    gon.careful = @diagnosis.careful
    gon.pride = @diagnosis.pride
    gon.picky = @diagnosis.picky
    gon.destruction = @diagnosis.destruction
    gon.narrow = @diagnosis.narrow
    gon.dirt = @diagnosis.dirt
    gon.high = @diagnosis.high
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    if @diagnosis.save
      flash[:notice] = "診断が完了しました"
      redirect_to diagnosis_path(@diagnosis.id)
    else
      flash[:notice] = "全ての項目をチェックしてください"
      redirect_to :action => "new"
    end
  end

  def diagnosis_params
    params.require(:diagnosis).permit(:id, :communication, :planning, :dexterous, :tidy, :physically, :muscle, :intelligence, :careful, :pride, :picky, :narrow, :dirt, :destruction, :high, :user_id)
  end
end

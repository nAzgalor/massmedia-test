class FeedbacksController < ApplicationController

  def index    
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to feedbacks_path, notice: "Ваш запрос ##{@feedback.id} создан. Мы ждем Вас в #{@feedback.date}" }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:age, :name, :date, :file, :previous_id)
    end
end

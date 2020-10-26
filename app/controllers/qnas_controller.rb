class QnasController < ApplicationController
  protect_from_forgery except: [:update]

  def index
    @qnas = Qna.all.order(question: :asc)
    respond_to :html
  end

  def create
    # Can we make this create also create TagTargets?  Use nested attributes?
    @qna = Qna.create!(qna_params)

    tags = Tag.where(id: qna_params[:tag_ids])
    targets = tags.each_with_object([]) do |t, r|
      r << { tag_id: t.id, target_type: 'Qna', target_id: @qna.id }
    end
    TagTarget.create!(targets)

    redirect_to "#{qnas_path}"
  end

  def update
    @qna = Qna.find(params[:id])
    @qna.images.purge if @qna.images.attached?
    @qna.update!(qna_params)

    respond_to :json
  end

  def destroy
    @qna = Qna.find(params[:id])
    @qna.destroy!

    redirect_to "#{qnas_path}"
  end

  private

  def qna_params
    params.require(:qna).permit(
      :question, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :images,
      tag_ids: []
    )
  end
end

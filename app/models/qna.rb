class Qna < ApplicationRecord
  validates :question, presence: true
  validates :answer_1, presence: true
  validates :correct_answer, presence: true

  has_many_attached :images

  has_many :tag_targets, as: :target, dependent: :destroy
  has_many :tags, through: :tag_targets

  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.correct_answer ||= 'answer_1'
  end
end

class Tag < ActiveRecord::Base
  has_many :tag_targets

  validates :name, presence: true

  def self.search_by_name(search_params)
    if search_params[:name].present?
      table = Tag.arel_table
      where(table[:name].matches("%#{search_params[:name]}%"))
    end
  end
end

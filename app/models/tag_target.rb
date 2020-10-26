class TagTarget < ActiveRecord::Base
  belongs_to :tag
  belongs_to :target, polymorphic: true
end

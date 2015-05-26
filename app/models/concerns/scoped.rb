module Scoped
  extend ActiveSupport::Concern

  included do
    scope :first_by, ->(id) {where(id: id).first}
  end
end

class User < ApplicationRecord
  has_many :document_templates

  def update_min_vars
    document_templates.map(&:user_vars).flatten.uniq.then { |vars| update(min_vars: vars) }
  end
end

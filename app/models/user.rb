class User < ApplicationRecord
  has_many :document_templates

  def missing_vars?
    (min_vars - vars.keys).any?
  end

  def update_min_vars
    document_templates.map(&:user_vars).flatten.uniq.then { |vars| update(min_vars: vars) }
  end

  def vars_fields
    min_vars.zip(Array(nil)).to_h.merge(vars).to_h
  end
end

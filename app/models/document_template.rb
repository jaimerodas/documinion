class DocumentTemplate < ApplicationRecord
  belongs_to :user

  before_save :update_vars
  after_save :update_user_min_vars

  validates :name, presence: true
  validates :liquid_text, presence: true

  def vars
    @vars ||= Liquid::ParseTreeVisitor
      .for(Liquid::Template.parse(liquid_text).root)
      .add_callback_for(Liquid::VariableLookup) { |node|
        [node.name, *node.lookups].join(".")
      }.visit.flatten.compact.uniq
  end

  private

  def update_vars
    self.user_vars = vars.map.with_index { |var, i|
      next unless var.start_with? "mi."
      vars[i] = nil
      var.delete_prefix("mi.")
    }.compact

    self.local_vars = vars.compact
  end

  def update_user_min_vars
    user.update_min_vars
  end
end

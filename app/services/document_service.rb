class DocumentService
  def self.render(template:, local_vars:)
    new(template, local_vars).run
  end

  def initialize(template, local_vars)
    @template = template.liquid_text
    @local_vars = local_vars.to_h
    @user_vars = template.user.vars
  end

  attr_reader :template, :local_vars, :user_vars

  def run
    Liquid::Template
      .parse(template)
      .render(vars)
      .then { |parsed_template| CommonMarker.render_html(parsed_template) }
  end

  private

  def vars
    local_vars.merge("mi" => user_vars)
  end
end

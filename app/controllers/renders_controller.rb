class RendersController < ApplicationController
  def create
    @render = DocumentService.render(template: document_template, local_vars: render_params).html_safe
    render "create"
  end

  private

  def render_params
    params.require(:render).permit(local_vars: {}).fetch(:local_vars)
  end

  def document_template
    @document_template ||= user.document_templates.find(params[:document_template_id])
  end

  def user
    @user ||= User.find(params[:user_id])
  end
end

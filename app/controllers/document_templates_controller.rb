class DocumentTemplatesController < ApplicationController
  before_action :document_template, only: %i[show edit update destroy]

  def index
    @document_templates = user.document_templates.all
  end

  def new
    @document_template = user.document_templates.build
  end

  def create
    @document_template = user.document_templates.build(document_template_params)

    if @document_template.save
      redirect_to user_document_template_path(user, @document_template)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @document_template.update(document_template_params)
      redirect_to user_document_template_path(user, @document_template)
    else
      render :new
    end
  end

  def destroy
    @document_template.destroy
    redirect_to user_document_templates_path(user)
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def document_template
    @document_template ||= user.document_templates.find(params[:id])
  end

  def document_template_params
    params.require(:document_template).permit(:name, :liquid_text)
  end
end

class DashboardController < ApplicationController

  def index
    @dashboards = Dashboard.where(user_id: current_user)
  end

  def show
    @dashboard = Dashboard.find(params[:id])
  end

  def new
    @dashboard = current_user.docs.build
  end

  def edit
    @dashboard = Dashboard.find(params[:id])
  end

  def create
    @dashboard = current_user.docs.build(doc_params)

    if @dashboard.save
      redirect_to @dashboard
    else
      render 'new'
    end
  end

  def update
    @dashboard = Dashboard.find(params[:id])
    if @dashboard.update(doc_params)
      redirect_to @dashboard
    else
      render 'edit'
    end
  end

  def destroy
    @dashboard = Dashboard.find(params[:id])
    @dashboard.destroy

    redirect_to dashboard_path
  end

  private
  def find_dashboard
    @dashboard = Dashboard.find(params[:id])
  end

  def dashboard_params
    params.require(:doc).permit(:title, :text)
  end
end

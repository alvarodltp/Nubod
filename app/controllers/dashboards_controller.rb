class DashboardsController < ApplicationController

  before_action :find_dashboard, only: [:show, :edit, :update, :destroy]

  def index
    @dashboards = Dashboard.where(user_id: current_user)
  end

  def show
    @dashboard = Dashboard.find(params[:id])
  end

  def new
    @dashboard = current_user.dashboards.build
  end

  def edit
    @dashboard = Dashboard.find(params[:id])
  end

  def create
    @dashboard = current_user.dashboards.create(dashboard_params)

    if @dashboard.save
      redirect_to @dashboard
    else
      render 'new'
    end
  end

  def update
    @dashboard = Dashboard.find(params[:id])
    if @dashboard.update(dashboard_params)
      redirect_to @dashboard
    else
      render 'edit'
    end
  end

  def destroy
    @dashboard = Dashboard.find(params[:id])
    @dashboard.destroy

    redirect_to dashboards_path
  end

  private
  def find_dashboard
    @dashboard = Dashboard.find(params[:id])
  end

  def dashboard_params
    params.require(:dashboard).permit(:title, :text, :document)
  end
end

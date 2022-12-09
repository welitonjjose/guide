class ChartController < ApplicationController
  def index
    redirect_to search_path
  end

  def show
    active = params[:active]

    result = ActiveService
      .new(active)
      .call
    
    @actives = Active
      .where(name: active)
      .order(open_in: :desc)
      .limit(30)

      respond_to do |format|
        format.json 
      end
  end
end

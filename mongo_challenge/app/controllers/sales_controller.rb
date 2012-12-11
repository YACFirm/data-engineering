class SalesController < ApplicationController
  def load
  end

  def process_file
    if params['sales'].blank?
      flash[:error] = "No file selected"
    else
      total_revenue = Sales::Loader.new(params['sales']).load
      flash[:notice] = "Last load total amount gross revenue: #{total_revenue}"
    end
    redirect_to sales_load_path
  end
end

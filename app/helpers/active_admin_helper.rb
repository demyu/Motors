module ActiveAdminHelper
  def chart_service(params = {})
    ChartService.new(params)
  end
end
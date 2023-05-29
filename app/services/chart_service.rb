class ChartService < BaseService
  attr_accessor :start_date, :end_date, :status, :type, :initial_object

  def initialize(options = {})
    initial_object = options[:type] || MoneyTransaction.all
    start_date     = options[:start_date] || initial_object.order(:created_at)
    end_date       = options[:end_date] || initial_object.order(:created_at)
    grouping       = options[:grouping]&.to_sym || :status
    type           = options[:type]
  end

  def pie_chart
    initial_object.where('created_at between ? and ?', start_date, end_date).group(grouping).count
  end
end
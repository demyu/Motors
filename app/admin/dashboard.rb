# frozen_string_literal: true
include ActiveAdminHelper

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  @data = chart_service
  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        render partial: 'charts/pie_chart'
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Payments" do
          ul do
            MoneyTransaction.last(10).map do |tran|
              li "Php #{tran.amount} payed by #{tran.driver.name&.titleize} as #{tran.payment_type.upcase} with status #{tran.status.upcase}"
            end #render partial: 'charts/pie_chart'
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end

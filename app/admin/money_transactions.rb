ActiveAdmin.register MoneyTransaction do

  #menu parent: 'status'#MoneyTransaction.enum_status
  #menu parent: 'type' #MoneyTransaction.enum_types

  form title: 'Transaction' do |f|
    inputs 'Details' do
      input :motor_id, :as => :select, :collection => Motor.pluck(:name, :id)
      input :driver_id, :as => :select, :collection => Driver.pluck(:name, :id)
      input :amount
      input :status, :as => :select, :collection => MoneyTransaction.enum_status
      input :payment_type, :as => :select, :collection => MoneyTransaction.enum_types
      input :notes
    end
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :amount, :status, :payment_type, :notes, :motor_id, :driver_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:amount, :status, :type, :notes, :motor_id, :driver_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

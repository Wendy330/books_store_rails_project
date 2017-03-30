ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :description, :price, :stock_quantity, :status, :image, :category_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  # form :html => { :enctype => "multipart/form-data" } do |f|
  #   f.input :image, required: false, hint: (("Current image:<br/>").html_safe + f.template.image_tag(f.object.image_url(:thumb))).html_safe
  #   f.input :remove_image, as: :boolean, required: false, label: "Remove Image"
  # end

end

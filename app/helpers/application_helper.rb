module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-success", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"  # Green
      when :error
        "alert-danger"   # Red
      when :alert
        "alert-warning"  # Yellow
      when :notice
        "alert-info"     # Blue
      else
        flash_type.to_s
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end

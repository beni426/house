module PropertysHelper
  def choose_new_or_edit
        if action_name == 'new' || action_name == 'create'
               propertys_path
        elsif action_name == 'edit'
               property_path
        end
    end
end

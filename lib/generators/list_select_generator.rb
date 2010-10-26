class ListSelectGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_list_file
    copy_file "#{file_name}.rb", "config/locales/#{file_name}.rb"
  end
end

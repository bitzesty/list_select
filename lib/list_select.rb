module ActionView
  module Helpers

    module FormOptionsHelper
      def list_select(object, method, list, options = {}, html_options = {})
        InstanceTag.new(object, method, self,  options.delete(:object)).to_list_select_tag(list, options, html_options)
      end

      def list_select_tag(name, list, options={}, html_options = {})
        content_tag :select,
                    list_options_for_select(list, options[:default], options[:priority_items]),
                    { "name" => name, "id" => name }.update(html_options.stringify_keys)
      end

      def list_options_for_select(list, selected = nil, priority_items = nil)
        list_options = ""
        items = I18n.translate(list)
        unless priority_items.blank?
          list_options += options_for_select(priority_items.map{|key| [items[key], key.to_s]}, selected)
          list_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
        end
        return list_options + options_for_select(items.map{|k, v| [v, k.to_s]}.sort, selected)
      end
    end

    class InstanceTag
      def to_list_select_tag(list, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            list_options_for_select(list, value || options[:default], options[:priority_items] || []),
            options, value
          ), html_options
        )
      end
    end
    
    class FormBuilder
      def list_select(method, list, options = {}, html_options = {})
        @template.list_select(@object_name, method, list, objectify_options(options), @default_options.merge(html_options))
      end
    end

  end
end

# country_select helper for integration with SimpleForm and Formtastic
module ActionView
  module Helpers
    module FormOptionsHelper
      def country_select(object, method, priority_countries = nil, options = {}, html_options = {})
        options = options.merge(:priority_items => priority_countries) if priority_countries
        list = options.delete(:list) || :countries_cldr
        list_select(object, method, list, options, html_options)
      end
    end
    class FormBuilder
      def country_select(method, priority_countries = nil, options = {}, html_options = {})
        options = options.merge(:priority_items => priority_countries) if priority_countries
        list = options.delete(:list) || :countries_cldr
        list_select(method, list, options, html_options)
      end
    end
  end
end


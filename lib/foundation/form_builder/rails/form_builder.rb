module Foundation
  module FormBuilder
    module Rails
      class FormBuilder < ActionView::Helpers::FormBuilder

=begin

  =================================================
  TODO
  =================================================

  ????? Pre/Postfix labels (Foundation) ?????
  ????? Switches (Foundation) ?????
  ????? Abide Validation (Foundaation) ?????

=end

        ERROR_CSS_CLASS = :error

        # A custom FormBuilder to provide forms marked up to work with the Foundation 5 CSS framework.
        # The default ActionView::Helpers::FormHelper methods are still available and will work exactly
        # as expected with RoR. Clearly, they will still have the Foundation 5 styling applied to them.
        #
        # For example of HTML markup for the forms, see:
        # http://foundation.zurb.com/docs/components/forms.html
        #
        # Each form needs to specifically reference this builder.

        # All examples shown are in the context of:
        #
        #   form_for @test, builder: ZurbFormBuilder do |f|
        #     ...
        #   end

        # Returns a single check_box with a label wrapped around it and an error label if an error in validation.
        # The options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_check_box :check_box
        #   # => <input name="test[check_box]" value="0" type="hidden">
        #         <input id="test_check_box" name="test[check_box]" value="1" type="checkbox">
        #         <label for="test">Check box</label>
        #
        #   f.zurb_check_box :check_box, field: { checked: true }
        #   # => <input name="test[check_box]" value="0" type="hidden">
        #         <input checked="checked" id="test_check_box" name="test[check_box]" value="1" type="checkbox">
        #         <label for="test">Check box</label>

        def zurb_check_box(method, options = { label: {}, field: {} }, checked_value = "1", unchecked_value = "0")
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.check_box(@object_name, method, options[:field], checked_value, unchecked_value) +
            @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}".html_safe,
              options[:label])

          errors.any? ? add_error_message(field, errors) : field
        end

        # Used to group a collection of check boxes together under one labelled heading. The overall label
        # name is determined by the method name or by specifying it explicitly in the :label options hash.
        # Each check box and its corresponding label is specified in a hash passed to tag_values, as
        # label: [checked_value, unchecked_value], with the any default checked values being specified in the
        # default options array. The options hash will be applied to radio button fields and labels only.
        # Full usage is similar to that of radio_button_group.
        #
        #   f.zurb_check_box_group :check_box_group, { yes: [true, false], no: [false, true] }, [:yes]
        #   # => <label for="test">Check box group</label>
        #         <input checked="checked" id="test_check_box_group" name="test[check_box_group]" value="true" type="checkbox">
        #         <label for="test">Yes</label>
        #         <input name="test[check_box_group]" value="true" type="hidden">
        #         <input id="test_check_box_group" name="test[check_box_group]" value="false" type="checkbox">
        #         <label for="test">No</label>
        def zurb_check_box_group(method, tag_values, checked = [], options = { label: {}, field: {} })
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
            errors = get_field_errors(method)
            add_error_class_to(options) if errors.any?

            field = @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}",
              options[:label])

            # Iterate through check boxes hash and check to see what values should be set as checked in
            # the checked array and adding each check box to @field
            tag_values.each do |tag_name, checked_unchecked_values|
              options[:field][:checked] = true if checked.include?(tag_name)
              field << @template.check_box(@object_name, method, options[:field], checked_unchecked_values[0],
                checked_unchecked_values[1]) +
                @template.label_tag(@object_name, "#{tag_name.to_s.humanize}".html_safe,
                  options[:label])
              options[:field][:checked] = nil # Reset checked as options is directly modified for all values
            end

            errors.any? ? add_error_message(field, errors) : field
        end

        # Works in exactly the same way as the standard collection_check_boxes method
        def zurb_collection_check_boxes(method, collection, value_method, text_method, options = {}, html_options = {}, &block) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}",
            options[:label])
          field << @template.collection_check_boxes(@object_name, method, collection, value_method, text_method,
            objectify_options(options[:field]), @default_options.merge(html_options), &block)

          errors.any? ? add_error_message(field, errors) : field
        end

        # Works in exactly the same way as the standard collection_radio_buttons method
        def zurb_collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}",
            options[:label])
          field << @template.collection_radio_buttons(@object_name, method, collection, value_method, text_method,
            objectify_options(options[:field]), @default_options.merge(html_options), &block)

          errors.any? ? add_error_message(field, errors) : field
        end

        # Works in exactly the same way as the standard collection_radio_buttons method
        def zurb_collection_select(method, collection, value_method, text_method, options = {}, html_options = {}) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}",
            options[:label])
          field << @template.collection_select(@object_name, method, collection, value_method, text_method,
            objectify_options(options[:field]), @default_options.merge(html_options))

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a color_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_color_field :color_field
        #   # => <label for="test">Color field<input id="test_color_field" name="test[color_field]" type="color"></label>
        def zurb_color_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.color_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a date_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_date_field :date_field
        #   # => <label for="test">Date field<input id="test_date_field" name="test[date_field]" type="date"></label>
        def zurb_date_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.date_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a datetime_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_datetime_field :datetime_field
        #   # => <label for="test">Datetime field<input id="test_datetime_field" name="test[datetime_field]"
        #         type="datetime"></label>
        def zurb_datetime_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.datetime_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a datetime_local_field with a label wrapped around it and an error label if an error in validation.
        # The options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_datetime_local_field :datetime_local_field
        #   # => <label for="test">Datetime local field<input id="test_datetime_local_field"
        #   name="test[datetime_local_field]" type="datetime-local"></label>
        def zurb_datetime_local_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.datetime_local_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a email_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_email_field :email_field
        #   # => <label for="test">Email field<input id="test_email_field" name="test[email_field]"
        #         type="email"></label>
        def zurb_email_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.email_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a file_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_file_field :file_field
        #   # => <label for="test">File field<input id="test_file_field" name="test[file_field]" type="file"></label>
        def zurb_file_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.file_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Works in exactly the same way as the standard grouped_collection_select method
        def zurb_grouped_collection_select(method, collection, group_method, group_label_method,
          option_key_method, option_value_method, options = {}, html_options = {})
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}",
            options[:label])
          field << @template.grouped_collection_select(@object_name, method, collection, group_method,
            group_label_method, option_key_method, option_value_method, objectify_options(options),
            @default_options.merge(html_options))

          errors.any? ? add_error_message(field, errors) : field
        end




        # Returns a month_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_month_field :month_field
        #   # => <label for="test">Month field<input id="test_month_field" name="test[month_field]" type="month"></label>
        def zurb_month_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.month_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a number_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_number_field :number_field
        #   # => <label for="test">Number field<input id="test_number_field" name="test[number_field]" type="number"></label>
        def zurb_number_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.number_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a text_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_password_field :password_field
        #   # => <label for="test">Password field
        #       <input id="test_password_field" name="test[password_field]" type="password"></label>
        def zurb_password_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.password_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a phone_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_phone_field :phone_field
        #   # => <label for="test">Phone field<input id="test_phone_field" name="test[phone_field]" type="phone"></label>
        def zurb_phone_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.phone_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a single radio_button with a label wrapped around it and an error label if an error in validation.
        # The options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        # It is very unlikely that this will be used on its own. Ever! Possibly remove?
        #
        #   f.zurb_radio_button :radio_button, :yes
        #   # => <input id="test_radio_button_yes" name="test[radio_button]" value="yes" type="radio">
        #         <label for="test">Radio button</label>

        def zurb_radio_button(method, tag_value, options = { label: {}, field: {} })
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.radio_button(@object_name, method, tag_value, options[:field]) +
            @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}".html_safe,
              options[:label])

          errors.any? ? add_error_message(field, errors) : field
        end

        # Used to group a collection of radio buttons together under one labelled heading. The overall label
        # name is determined by the method name or by specifying it explicitly in the :label options hash.
        # Each radio button and its corresponding label is specified in a hash passed to tag_values, as
        # label: :value, with the default radio button value being specified in the default option.
        # The options hash will be applied to radio button fields and labels only.
        #
        #   f.zurb_radio_button_group :radio_button_group, {yes: true, no: false
        #   # => <label for="test">Radio button group</label>
        #         <input id="test_radio_button_group_true" name="test[radio_button_group]" value="true" type="radio">
        #         <label for="test">Yes</label>
        #         <input id="test_radio_button_group_false" name="test[radio_button_group]" value="false" type="radio">
        #         <label for="test">No</label>
        #
        #   f.zurb_radio_button_group :radio_button_group, {yes: true, no: false}, false
        #   # => <label for="test">Radio button group</label>
        #         <input id="test_radio_button_group_true" name="test[radio_button_group]" value="true" type="radio">
        #         <label for="test">Yes</label>
        #         <input checked="checked" id="test_radio_button_group_false" name="test[radio_button_group]" value="false" type="radio">
        #         <label for="test">No</label>
        #
        #   f.zurb_radio_button_group :text_field, {yes: true, no: false}, false,
        #     label: { label: "Giant chicken?" }
        #   # => <label for="test" label="Giant chicken?">Giant chicken?</label>
        #         <input id="test_text_field_true" name="test[text_field]" value="true" type="radio">
        #         <label for="test" label="Giant chicken?">Yes</label>
        #         <input checked="checked" id="test_text_field_false" name="test[text_field]" value="false" type="radio">
        #         <label for="test" label="Giant chicken?">No</label>
        def zurb_radio_button_group(method, tag_values, default = nil, options = { label: {}, field: {} })
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
            errors = get_field_errors(method)
            add_error_class_to(options) if errors.any?

            field = @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}",
              options[:label])

            # Iterate through radio buttons hash and check to see what value should be set as the default
            # adding each radio button to @field
            tag_values.each do |tag_name, tag_value|
              options[:field][:checked] = true if tag_value == default
              field << @template.radio_button(@object_name, method, tag_value, options[:field]) +
              @template.label_tag(@object_name, tag_name.to_s.capitalize, options[:label])
            end

            errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a range_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_range_field :range_field
        #   # => <label for="test">Range field<input id="test_range_field" name="test[range_field]" type="range"></label>
        def zurb_range_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.range_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a search_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_search_field :search_field
        #   # => <label for="test">Search field<input id="test_search_field" name="test[search_field]" type="search"></label>
        def zurb_search_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.search_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Works in exactly the same way as the standard select method
        #
        #   f.zurb_select :id, Continent.all.collect { |c| [c.name, c.id] }, {include_blank: true, label: {label:"Test"}}
        #   # => <label for="continent" label="Test">Test</label>
        #          <select id="continent_id" name="continent[id]">
        #          <option value=""></option>
        #          <option value="1">Europe</option>
        #          <option value="2">Asia</option></select>
        def zurb_select(method, choices = nil, options = { label: {}, field: {} }, html_options = {}, &block)
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}",
            options[:label])
          field << @template.select(@object_name, method, choices, options, html_options, &block)

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a telephone_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_telephone_field :telephone_field
        #   # => <label for="test">Telephone field<input id="test_telephone_field" name="test[telephone_field]" type="telephone"></label>
        def zurb_telephone_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.telephone_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a text_area with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_text_area :text_area, field: { rows: 5 }
        #   # => <label for="test">Text area
        #       <textarea id="test_text_area" name="test[text_area]" rows="5"></textarea></label>
        def zurb_text_area(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.text_area(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a text_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_text_field :text_field
        #   # => <label for="test">Text field<input id="test_text_field" name="test[text_field]" type="text" /></label>
        #
        #   f.zurb_text_field :text_field, label: { label: "Custom label text", class: "some-class" }
        #   # => <label class="some-class" for="test" label="Custom label text">Custom label text
        #       <input id="test_text_field" name="test[text_field]" type="text"></label>
        #
        #   f.zurb_text_field :text_field, field: { placeholder: "Text here" }
        #   # => <label for="test">Text field
        #       <input id="test_text_field" name="test[text_field]" placeholder="Text here" type="text"></label>
        #
        #   f.zurb_text_field :text_field, label: { class: "some-class" }, field: { placeholder: "Text here" }
        #   # => <label class="some-class" for="test">Text field
        #       <input id="test_text_field" name="test[text_field]" placeholder="Text here" type="text"></label>
        def zurb_text_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          @errors = object.errors
          errors = get_field_errors(method)
          add_error_class_to(options) if @errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.text_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a time_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_time_field :time_field
        #   # => <label for="test">Time field<input id="test_time_field" name="test[time_field]" type="time"></label>
        def zurb_time_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.time_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Works in exactly the same way as the standard time_zone_select method
        def zurb_time_zone_select(method, priority_zones = nil, options = { label: {}, field: {} }, html_options = {})
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name, "#{options[:label][:label] || method.to_s.humanize}",
            options[:label])
          field << @template.time_zone_select(@object_name, method, priority_zones, options[:field], html_options)

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a url_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_url_field :url_field
        #   # => <label for="test">Url field<input id="test_url_field" name="test[url_field]" type="url"></label>
        def zurb_url_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.url_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        # Returns a week_field with a label wrapped around it and an error label if an error in validation. The
        # options hash can be used to further customise the label and field, but specific options must be
        # provided in a hash for that element.
        #
        #   f.zurb_week_field :week_field
        #   # => <label for="test">Week field<input id="test_week_field" name="test[week_field]" type="week"></label>
        def zurb_week_field(method, options = { label: {}, field: {} }) 
          set_options(options)  # If only :field set throws error when accessing :label, and vice versa.
          errors = get_field_errors(method)
          add_error_class_to(options) if errors.any?

          field = @template.label_tag(@object_name,
            "#{options[:label][:label] || method.to_s.humanize}
                #{@template.week_field(@object_name, method, options[:field])}".html_safe,
            options[:label]
          )

          errors.any? ? add_error_message(field, errors) : field
        end

        private

          # Ensure the options hash contains a hash for :field and :label, otherwise we get an error
          def set_options(options)
            options[:label] ||= {}
            options[:field] ||= {}
          end

          # Return any errors for the field we are working with
          def get_field_errors(method)
            # If we have any errors, assign them to our variable then remove them from Rails
            # default object to prevent <div></div> inside <label></label>
            @errors[method]
          end

          # Return a class attribute containing the css error class for the label
          # Could also put in option to return an error class to the field tag too.
          def add_error_class_to(options)
            options[:label][:class].blank? ? options[:label][:class] = ERROR_CSS_CLASS : options[:label][:class] += ERROR_CSS_CLASS
          end

          # Return an error notice concatenated to the end of the field and label
          def add_error_message(field, errors)
            field += @template.content_tag(:small, errors.join(', ').humanize, class: ERROR_CSS_CLASS)
          end

      end
    end
  end
end
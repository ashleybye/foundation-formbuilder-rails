class FoundationFormBuilder < ActionView::Helpers::FormBuilder

=begin

  =================================================
  TODO
  =================================================

  ===== FormHelper =====

  check_box
  radio_button
  time_field
  url_field
  week_field

  ====== FormOptionsHelper =====

  collection_check_boxes,
  collection_radio_buttons,
  collection_select
  grouped_collection_select,
  grouped_options_for_select
  option_groups_from_collection_for_select,
  options_for_select,
  options_from_collection_for_select
  select
  time_zone_options_for_select,
  time_zone_select

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
    errors = get_field_errors(method)
    add_error_class_to(options) if errors.any?

    field = @template.label_tag(@object_name,
      "#{options[:label][:label] || method.to_s.humanize}
          #{@template.text_field(@object_name, method, options[:field])}".html_safe,
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
      object.errors[method]
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
class FoundationFormBuilder < ActionView::Helpers::FormBuilder

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
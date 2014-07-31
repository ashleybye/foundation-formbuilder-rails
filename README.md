# foundation-formbuilder-rails v0.2.4

This is a custom FormBuilder used to display form elements generated
by the `form_for` helpers in the correct style for
the [*Foundation 5 Framework*](http://foundation.zurb.com/).


See the Foundation [docs](http://foundation.zurb.com/docs/components/forms.html)
for form specifics.

## Getting Started

1.  Add the `foundation-formbuilder-rails` Gem to your project's `Gemfile`:

        gem 'foundation-formbuilder-rails'

2.  Ensure you are using the FormBuilder in your form:

        form_for @test, builder: Foundation::FormBuilder::Rails::FormBuilder do |f|
           ...
        end

3.  Alternatively, you can set the FormBuilder globally in an initializer,
    `ActionView::Base.default_form_builder = Foundation::FormBuilder::Rails::FormBuilder`.

4.  This can be achieved by running:

        rails generate foundation:form_builder:install

5.  Be sure to restart your application once this has been done. Then you only need:

        form_for @test do |f|

6.  For usage, see comments in the [source code](https://github.com/ashleybye/foundation-formbuilder-rails/blob/master/lib/foundation/form_builder/rails/form_builder.rb). I will get around to adding proper use examples to the README in the future. However, as a quick reference, the original Rails methods will
still return the standard content but prefix with `zurb_` and it will return the content formatted
for Foundation:

        form_for @test do |f|
          f.zurb_text_field :name
        end
        # => <form accept-charset="UTF-8" action="/test" class="new_test" id="new_test" method="post">
                <div style="display:none">
                  <input name="utf8" type="hidden" value="&#x2713;" />
                  <input name="authenticity_token" type="hidden" value="ofJbUSioJ9w+c6EkPy993jtBskYMK/97gp667ACWZDI=" />
                </div>
                <label for="test">Name
                  <input id="message_name" name="test[name]" type="text" />
                </label>
              </form>

## Complete

I have completed the builder for all of the Rails FormBuilder and FormOptionsHelper
methods. I have also included some Foundation specific methods, but I may remove these
before the final release.

### FormHelper

`check_box`
`color_field`
`date_field`
`datetime_field`
`datetime_local_field`
`email_field`
`file_field`
`month_field`
`number_field`
`password_field`
`phone_field`
`radio_button`
`range_field`
`search_field`
`telephone_field`
`time_field`
`text_field`
`text_area`
`url_field`
`week_field`

### FormOptionsHelper

`collection_check_boxes`
`collection_radio_buttons`
`collection_select`
`grouped_collection_select`
`select`
`time_zone_select`

### Foundation Specific

`check_box_group`
`radio_button_group`

(May be removed at a later stage)

## Development

This project is still under development, although the main functionality works. I am still deciding
whether to keep the `zurb_` prefix plus the ability to produce field tags that are not wrapped in a
label.

If you wish to contribute please contact me.

### Possibilities

I am still deciding whether it is worth writing builder methods to provide the following:

`Pre/Postfix labels (Foundation)`
`Switches (Foundation)`
`Abide Validation (Foundaation)`

## Issues

If you notice any problems with this Gem please file an [issue](https://github.com/ashleybye/foundation-formbuilder-rails/issues).
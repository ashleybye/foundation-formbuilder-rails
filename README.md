# Foundation FormBuilder

This is a custom FormBuilder used to display form elements generated
by the form_for helpers in the correct style for
the [*Foundation 5 Framework*](http://foundation.zurb.com/).


See the Foundation [docs](http://foundation.zurb.com/docs/components/forms.html)
for form specifics.

# Getting Started

1.  Copy [foundation_form_builder.rb](https://github.com/ashleybye/foundation-form-builder/blob/master/app/helpers/zurb/foundation_form_builder.rb) into your project,
in the following directory:

        app/helpers

2.  Ensure you are using the FormBuilder in your form:

        form_for @test, builder: Zurb::FoundationFormBuilder do |f|
           ...
        end

3.  For usage, see comments in the [source code](https://github.com/ashleybye/foundation-form-builder/blob/master/app/helpers/zurb/foundation_form_builder.rb).

# Complete

I have completed the builder for all of the Rails FormBuilder and FormOptionsHelper
methods. I have also included some Foundation specific methods, but I may remove these
before the final release.

## FormHelper

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

## FormOptionsHelper

`collection_check_boxes`
`collection_radio_buttons`
`collection_select`
`grouped_collection_select`
`select`
`time_zone_select`

## Foundation Specific

(May be removed at a later stage)
`check_box_group`
`radio_button_group`

# TODO

I am still deciding whether it is worth writing builder methods to provide the following:

`Pre/Postfix labels (Foundation)`
`Switches (Foundation)`
`Abide Validation (Foundaation)`
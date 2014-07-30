# Foundation FormBuilder

This is a custom FormBuilder used to display form elements generated
by the form_for helpers in the correct style for
the [*Foundation 5 Framework*](http://foundation.zurb.com/).


See the Foundation [docs](http://foundation.zurb.com/docs/components/forms.html)
for form specifics.

# Getting Started

1.  Copy [foundation_form_builder.rb](https://github.com/ashleybye/foundation-form-builder/blob/master/app/helpers/foundation_form_builder.rb) into your project,
in the following directory:

        app/helpers

2.  Ensure you are using the FormBuilder in your form:

        form_for @test, builder: FoundationFormBuilder do |f|
           ...
        end

3.  For usage, see comments in the [source code](https://github.com/ashleybye/foundation-form-builder/blob/master/app/helpers/foundation_form_builder.rb).

# Complete

Currently, I have only completed:

`color_field`
`date_field`
`datetime_field`
`datetime_local_field`
`email_field`
`file_field`
`text_field`
`text_area`
`password_field`

# TODO

## FormHelper

`check_box`
`month_field`
`number_field`
`phone_field`
`radio_button`
`range_field`
`search_field`
`telephone_field`
`time_field`
`url_field`
`week_field`

## FormOptionsHelper

`collection_check_boxes`
`collection_radio_buttons`
`collection_select`
`grouped_collection_select`
`grouped_options_for_select`
`option_groups_from_collection_for_select`
`options_for_select`
`options_from_collection_for_select`
`select`
`time_zone_options_for_select`
`time_zone_select`

## Under consideration

`Pre/Postfix labels (Foundation)`
`Switches (Foundation)`
`Abide Validation (Foundaation)`
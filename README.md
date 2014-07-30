## Foundation FormBuilder

This is a custom FormBuilder used to display form elements generated
by the form_for helpers in the correct style for
the [*Foundation 5 Framework*](http://foundation.zurb.com/).


See the Foundation [docs](http://foundation.zurb.com/docs/components/forms.html)
for form specifics.

## Getting Started

1.  Copy [zurb_form_builder.rb](https://github.com/ashleybye/zurb-form-builder/blob/master/app/helpers/zurb_form_builder.rb) into your project,
in the following directory:

        app/helpers

2.  Ensure you are using the FormBuilder in your form:

        form_for @test, builder: ZurbFormBuilder do |f|
           ...
        end

3.  For usage, see comments in the [source code](https://github.com/ashleybye/zurb-form-builder/blob/master/app/helpers/zurb_form_builder.rb).

## TODO

Complete FormBuilder for all form objects. Currently, I have only done:

1.  `text_field`
2.  `text_area`
3.  `password_field`
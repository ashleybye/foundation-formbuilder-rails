# ActionView::Helpers::FormBuilder.send(:include, Foundation::FormBuilder::Rails)

RSpec.describe 'text_field', :type => :view do

  # class User
  #   def self.all
  #     :value
  #   end
  # end

  it 'has something on the page' do
    let(:users) {[
      mock_model("User", id: 1, name: 'Ashley')
    ]}
    stub_template 'users/_form.html.erb' => "<%= form_for @user do |f| %><%= f.text_field :name' %><% end %>"
    render
    rendered.should =~ /Ashley/
  end

  # it 'has something on the page' do
  #   user = double("User", id: 1, name: 'Ashley')
  #   allow(User).to receive(:all) { user }
  #   stub_template 'users/_form.html.erb' => "<%= form_for @user do |f| %><%= f.text_field :name' %><% end %>"
  #   render
  #   rendered.should =~ /Ashley/
  # end
end
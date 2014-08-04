describe 'text_field' do

  it 'has something on the page' do
    assigns(:users, [
      mock_model("User", id: 1, name: 'Ashley')
    ])
    stub_template 'users/_form.html.erb' => "<%= form_for user do |f| %><%= f.text_field :name' %><% end %>"
    render
    rendered.should =~ /Ashley/
  end
end
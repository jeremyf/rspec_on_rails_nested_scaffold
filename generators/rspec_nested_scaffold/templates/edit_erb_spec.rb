require File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../../spec_helper'

describe "/<%= table_name %>/edit.<%= default_file_extension %>" do
  include <%= controller_class_name %>Helper
  
  before do
    @<%= file_name %> = mock_model(<%= class_name %>)
    @<%= nesting_owner %> = mock_model(<%= nesting_owner_class %>)
<% for attribute in attributes -%>
    @<%= file_name %>.stub!(:<%= attribute.name %>).and_return(<%= attribute.default_value %>)
<% end -%>
    assigns[:<%= file_name %>] = @<%= file_name %>
    assigns[:<%= nesting_owner %>] = @<%= nesting_owner %>
  end

  it "should render edit form" do
    render "/<%= table_name %>/edit.<%= default_file_extension %>"
    
    response.should have_tag("form[action=#{<%= nesting_owner %>_<%= file_name %>_path(@<%= nesting_owner %>, @<%= file_name %>)}][method=post]") do
      with_tag('div[style=?]', "margin:0;padding:0") do
        with_tag('input[name=_method][type=hidden][value=put]')
      end
<% for attribute in attributes -%><% unless attribute.name =~ /_id/ || [:datetime, :timestamp, :time, :date].index(attribute.type) -%>
      with_tag('<%= attribute.input_type -%>#<%= file_name %>_<%= attribute.name %>[name=?]', "<%= file_name %>[<%= attribute.name %>]")
<% end -%><% end -%>
    end
  end
end



require File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../spec_helper'

describe <%= controller_class_name %>Controller do
  describe "route generation" do

    it "should map { :controller => '<%= table_name %>',  :action => 'index', :<%= nesting_owner %>_id => '2' } to /<%= nesting_owner.pluralize %>/2/<%= table_name %>" do
      route_for(:controller => "<%= table_name %>",  :action => 'index', :<%= nesting_owner %>_id => '2').should == "/<%= nesting_owner.pluralize %>/2/<%= table_name %>"
    end
  
    it "should map { :controller => '<%= table_name %>',  :action => 'new', :<%= nesting_owner %>_id => '2' } to /<%= nesting_owner.pluralize %>/2/<%= table_name %>/new" do
      route_for(:controller => "<%= table_name %>",  :action => 'new', :<%= nesting_owner %>_id => '2').should == "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/new"
    end
  
    it "should map { :controller => '<%= table_name %>',  :action => 'show', :<%= nesting_owner %>_id => '2', :id => 1 } to /<%= nesting_owner.pluralize %>/2/<%= table_name %>/1" do
      route_for(:controller => "<%= table_name %>",  :action => 'show', :<%= nesting_owner %>_id => '2', :id => 1).should == "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/1"
    end
  
    it "should map { :controller => '<%= table_name %>',  :action => 'edit', :<%= nesting_owner %>_id => '2', :id => 1 } to /<%= nesting_owner.pluralize %>/2/<%= table_name %>/1<%= resource_edit_path %>" do
      route_for(:controller => "<%= table_name %>",  :action => 'edit', :<%= nesting_owner %>_id => '2', :id => 1).should == "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/1<%= resource_edit_path %>"
    end
  
    it "should map { :controller => '<%= table_name %>',  :action => 'update', :<%= nesting_owner %>_id => '2', :id => 1} to /<%= nesting_owner.pluralize %>/2/<%= table_name %>/1" do
      route_for(:controller => "<%= table_name %>",  :action => 'update', :<%= nesting_owner %>_id => '2', :id => 1).should == "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/1"
    end
  
    it "should map { :controller => '<%= table_name %>',  :action => 'destroy', :<%= nesting_owner %>_id => '2', :id => 1} to /<%= nesting_owner.pluralize %>/2/<%= table_name %>/1" do
      route_for(:controller => "<%= table_name %>",  :action => 'destroy', :<%= nesting_owner %>_id => '2', :id => 1).should == "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => '<%= table_name %>', action => 'index', :<%= nesting_owner %>_id => '2' } from GET /<%= nesting_owner.pluralize %>/2/<%= table_name %>" do
      params_from(:get, "/<%= nesting_owner.pluralize %>/2/<%= table_name %>").should == {:controller => "<%= table_name %>",  :action => 'index', :<%= nesting_owner %>_id => '2'}
    end
  
    it "should generate params { :controller => '<%= table_name %>', action => 'new', :<%= nesting_owner %>_id => '2' } from GET /<%= nesting_owner.pluralize %>/2/<%= table_name %>/new" do
      params_from(:get, "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/new").should == {:controller => "<%= table_name %>",  :action => 'new', :<%= nesting_owner %>_id => '2'}
    end
  
    it "should generate params { :controller => '<%= table_name %>', action => 'create', :<%= nesting_owner %>_id => '2' } from POST /<%= nesting_owner.pluralize %>/2/<%= table_name %>" do
      params_from(:post, "/<%= nesting_owner.pluralize %>/2/<%= table_name %>").should == {:controller => "<%= table_name %>",  :action => 'create', :<%= nesting_owner %>_id => '2'}
    end
  
    it "should generate params { :controller => '<%= table_name %>', action => 'show', :<%= nesting_owner %>_id => '2', id => '1' } from GET /<%= nesting_owner.pluralize %>/2/<%= table_name %>/1" do
      params_from(:get, "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/1").should == {:controller => "<%= table_name %>",  :action => 'show', :<%= nesting_owner %>_id => '2', :id => "1"}
    end
  
    it "should generate params { :controller => '<%= table_name %>', action => 'edit', :<%= nesting_owner %>_id => '2', id => '1' } from GET /<%= nesting_owner.pluralize %>/2/<%= table_name %>/1;edit" do
      params_from(:get, "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/1<%= resource_edit_path %>").should == {:controller => "<%= table_name %>",  :action => 'edit', :<%= nesting_owner %>_id => '2', :id => "1"}
    end
  
    it "should generate params { :controller => '<%= table_name %>', action => 'update', :<%= nesting_owner %>_id => '2', id => '1' } from PUT /<%= nesting_owner.pluralize %>/2/<%= table_name %>/1" do
      params_from(:put, "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/1").should == {:controller => "<%= table_name %>",  :action => 'update', :<%= nesting_owner %>_id => '2', :id => "1"}
    end
  
    it "should generate params { :controller => '<%= table_name %>', action => 'destroy', :<%= nesting_owner %>_id => '2', id => '1' } from DELETE /<%= nesting_owner.pluralize %>/2/<%= table_name %>/1" do
      params_from(:delete, "/<%= nesting_owner.pluralize %>/2/<%= table_name %>/1").should == {:controller => "<%= table_name %>",  :action => 'destroy', :<%= nesting_owner %>_id => '2', :id => "1"}
    end
  end
end
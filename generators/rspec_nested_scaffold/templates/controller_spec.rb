require File.dirname(__FILE__) + '/../spec_helper'

describe <%= controller_class_name %>Controller do
  before(:each) do
    @<%= file_name %> = mock_model(<%= class_name %>, :to_param => '1')
    @<%= nesting_owner %> = mock_model(<%= nesting_owner_class %>, :<%= table_name %> => [@<%= file_name %>], :to_param => '2')
    <%= nesting_owner_class %>.stub!(:find).with('2').and_return(@<%= nesting_owner %>)
  end

  describe "handling GET /<%= nesting_owner %>s/:<%= nesting_owner %>_id/<%= table_name %>" do
    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).with(:all).and_return([@<%= file_name %>])
    end
    def do_get
      get :index, :<%= nesting_owner %>_id => '2'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should assign the found <%= nesting_owner %> for the view" do
      do_get
      assigns[:<%= nesting_owner %>].should == @<%= nesting_owner %>
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end

    it "should find all <%= table_name %> owned by <%= nesting_owner %>" do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).with(:all).and_return([@<%= file_name %>])
      do_get
    end

    it "should assign the found <%= table_name %> for the view" do
      do_get
      assigns[:<%= table_name %>].should == [@<%= file_name %>]
    end
  end

  describe "handling GET /<%= nesting_owner %>s/:<%= nesting_owner %>_id/<%= table_name %>.xml" do

    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).and_return([@<%= file_name %>])
    end

    def do_get
      @<%= nesting_owner %>.<%= table_name %>.stub!(:to_xml).and_return("XML")
      @<%= file_name %>.stub!(:to_xml).and_return("XML")
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index, :<%= nesting_owner %>_id => '2'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all <%= table_name %>" do
      @<%= nesting_owner %>.<%= table_name %>.should_receive(:find).and_return([@<%= file_name %>])
      do_get
    end

    it "should render the found <%= table_name %> as xml" do
      @<%= file_name %>.should_receive(:to_xml).and_return("XML")
      do_get
    end
  end

  describe "handling GET /<%= nesting_owner %>s/:<%= nesting_owner %>_id/<%= table_name %>/1" do

    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).with('1').and_return(@<%= file_name %>)
    end

    def do_get
      get :show, :<%= nesting_owner %>_id => '2', :id => '1'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render show template" do
      do_get
      response.should render_template('show')
    end

    it "should find the <%= file_name %> requested" do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).with('1').and_return(@<%= file_name %>)
      do_get
    end

    it "should assign the found <%= file_name %> for the view" do
      do_get
      assigns[:<%= file_name %>].should equal(@<%= file_name %>)
    end

    it "should assign the found <%= nesting_owner %> for the view" do
      do_get
      assigns[:<%= nesting_owner %>].should == @<%= nesting_owner %>
    end

  end

  describe "handling GET /<%= nesting_owner %>s/:<%= nesting_owner %>_id/<%= table_name %>/1.xml" do

    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).with('1').and_return(@<%= file_name %>)
    end

    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :<%= nesting_owner %>_id => '2', :id => '1'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find the <%= file_name %> requested" do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).with('1').and_return(@<%= file_name %>)
      do_get
    end

    it "should render the found <%= file_name %> as xml" do
      @<%= file_name %>.stub!(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /<%= nesting_owner %>s/:<%= nesting_owner %>_id/<%= table_name %>/new" do

    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:build).and_return(@<%= file_name %>)
    end

    def do_get
      get :new, :<%= nesting_owner %>_id => '2'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render new template" do
      do_get
      response.should render_template('new')
    end

    it "should create an new <%= file_name %>" do
      @<%= nesting_owner %>.<%= table_name %>.should_receive(:build).and_return(@<%= file_name %>)
      do_get
    end

    it "should not save the new <%= file_name %>" do
      @<%= file_name %>.should_not_receive(:save)
      do_get
    end

    it "should assign the new <%= file_name %> for the view" do
      do_get
      assigns[:<%= file_name %>].should equal(@<%= file_name %>)
    end

    it "should assign the <%= nesting_owner_class %> for the view" do
      do_get
      assigns[:<%= nesting_owner %>].should equal(@<%= nesting_owner %>)
    end
  end

  describe "handling GET /<%= nesting_owner %>s/:<%= nesting_owner %>_id/<%= table_name %>/1/edit" do

    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).and_return(@<%= file_name %>)
    end

    def do_get
      get :edit, :<%= nesting_owner %>_id => '2', :id => '1'
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end

    it "should find the <%= file_name %> requested" do
      @<%= nesting_owner %>.<%= table_name %>.should_receive(:find).with('1').and_return(@<%= file_name %>)
      do_get
    end

    it "should assign the found <%= class_name %> for the view" do
      do_get
      assigns[:<%= file_name %>].should equal(@<%= file_name %>)
    end

    it "should assign the <%= nesting_owner_class %> for the view" do
      do_get
      assigns[:<%= nesting_owner %>].should equal(@<%= nesting_owner %>)
    end
  end

  describe "handling POST /<%= nesting_owner.pluralize %>/:<%= nesting_owner %>_id/<%= table_name %>" do

    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:build).and_return(@<%= file_name %>)
    end

    describe "with successful save" do

      def do_post
        @<%= file_name %>.should_receive(:save).and_return(true)
        post :create, :<%= nesting_owner %>_id => '2', :<%= file_name %> => {}
      end

      it "should create a new <%= file_name %>" do
        @<%= nesting_owner %>.<%= table_name %>.should_receive(:build).with({}).and_return(@<%= file_name %>)
        do_post
      end

      it "should redirect to the new <%= file_name %>" do
        do_post
        response.should redirect_to(<%= nesting_owner %>_<%= file_name %>_path(@<%= nesting_owner %>, @<%= file_name %>))
      end

    end

    describe "with failed save" do

      def do_post
        @<%= file_name %>.should_receive(:save).and_return(false)
        post :create, :<%= nesting_owner %>_id => '2', :<%= file_name %> => {}
      end

      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end

    end
  end

  describe "handling PUT /<%= nesting_owner.pluralize %>/:<%= nesting_owner %>_id/<%= table_name %>/1" do

    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).and_return(@<%= file_name %>)
    end

    describe "with successful update" do

      def do_put
        @<%= file_name %>.should_receive(:update_attributes).and_return(true)
        put :update, :<%= nesting_owner %>_id => '2', :id => '1'
      end

      it "should find the <%= file_name %> requested" do
        @<%= nesting_owner %>.<%= table_name %>.should_receive(:find).with('1').and_return(@<%= file_name %>)
        do_put
      end

      it "should update the found <%= file_name %>" do
        do_put
        assigns(:<%= file_name %>).should equal(@<%= file_name %>)
      end

      it "should assign the found <%= file_name %> for the view" do
        do_put
        assigns(:<%= file_name %>).should equal(@<%= file_name %>)
      end

      it "should assign the <%= nesting_owner %> for the view" do
        do_put
        assigns(:<%= nesting_owner %>).should equal(@<%= nesting_owner %>)
      end

      it "should redirect to the <%= file_name %>" do
        do_put
        response.should redirect_to(<%= nesting_owner %>_<%= file_name %>_url(@<%= nesting_owner %>, @<%= file_name %>))
      end

    end

    describe "with failed update" do

      def do_put
        @<%= file_name %>.should_receive(:update_attributes).and_return(false)
        put :update, :<%= nesting_owner %>_id => '2', :id => '1'
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /<%= nesting_owner.pluralize %>/:<%= nesting_owner %>_id/<%= table_name %>/1" do

    before(:each) do
      @<%= nesting_owner %>.<%= table_name %>.stub!(:find).and_return(@<%= file_name %>)
      @<%= file_name %>.stub!(:destroy).and_return(true)
    end

    def do_delete
      delete :destroy, :<%= nesting_owner %>_id => '2', :id => '1'
    end

    it "should find the <%= file_name %> requested" do
      @<%= nesting_owner %>.<%= table_name %>.should_receive(:find).with('1').and_return(@<%= file_name %>)
      do_delete
    end

    it "should call destroy on the found <%= file_name %>" do
      @<%= file_name %>.should_receive(:destroy)
      do_delete
    end

    it "should redirect to the <%= nesting_owner %>'s <%= table_name %> list" do
      do_delete
      response.should redirect_to(<%= nesting_owner %>_<%= table_name %>_url(@<%= nesting_owner %>))
    end
  end
end

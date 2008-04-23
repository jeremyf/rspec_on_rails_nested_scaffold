class <%= controller_class_name %>Controller < ApplicationController
  
  protected
  
  # The nested resource owner.
  def <%= nesting_owner %>
    @<%=nesting_owner %> ||= <%= nesting_owner_class %>.find(params[:<%= nesting_owner %>_id])
  end
  
  public
  
  # GET /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>
  # GET /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>.xml
  def index
    @<%= table_name %> = <%= nesting_owner %>.<%= table_name %>.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @<%= table_name %> }
    end
  end

  # GET /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/1
  # GET /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/1.xml
  def show
    @<%= file_name %> = <%= nesting_owner %>.<%= table_name %>.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @<%= file_name %> }
    end
  end

  # GET /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/new
  # GET /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/new.xml
  def new
    @<%= file_name %> = <%= nesting_owner %>.<%= table_name %>.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @<%= file_name %> }
    end
  end

  # GET /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/edit
  def edit
    @<%= file_name %> = <%= nesting_owner %>.<%= table_name %>.find(params[:id])
  end

  # POST /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>
  # POST /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>.xml
  def create
    @<%= file_name %> = <%= nesting_owner %>.<%= table_name %>.build(params[:<%= file_name %>])

    respond_to do |format|
      if @<%= file_name %>.save
        flash[:notice] = '<%= class_name %> was successfully created.'
        format.html { redirect_to(<%= nesting_owner %>_<%= file_name %>_url(<%= nesting_owner %>, @<%= file_name %>)) }
        format.xml  { render :xml => @<%= file_name %>, :status => :created, :location => <%= nesting_owner %>_<%= file_name %>_path(<%= nesting_owner %>, @<%= file_name %>) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @<%= file_name %>.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/1
  # PUT /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/1.xml
  def update
    @<%= file_name %> = <%= nesting_owner %>.<%= table_name %>.find(params[:id])

    respond_to do |format|
      if @<%= file_name %>.update_attributes(params[:<%= file_name %>])
        flash[:notice] = '<%= class_name %> was successfully updated.'
        format.html { redirect_to(<%= nesting_owner %>_<%= file_name %>_url(<%= nesting_owner %>, @<%= file_name %>)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @<%= file_name %>.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/1
  # DELETE /<%=nesting_owner.pluralize%>/:<%=nesting_owner%>_id/<%= table_name %>/1.xml
  def destroy
    @<%= file_name %> = <%= nesting_owner %>.<%= table_name %>.find(params[:id])
    @<%= file_name %>.destroy

    respond_to do |format|
      format.html { redirect_to(<%= nesting_owner %>_<%= table_name %>_path(<%= nesting_owner %>)) }
      format.xml  { head :ok }
    end
  end
end

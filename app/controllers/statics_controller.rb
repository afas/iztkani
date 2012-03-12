class StaticsController < ApplicationController
  # GET /statics
  # GET /statics.xml
  def index
    @statics = Static.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @statics }
    end
  end

  # GET /statics/1
  # GET /statics/1.xml
  def show
    @static = Static.find_by_url_part(params[:url_part])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @static }
    end
  end

  # GET /statics/new
  # GET /statics/new.xml
  def new
    @static = Static.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @static }
    end
  end

  # GET /statics/1/edit
  def edit
    @static = Static.find(params[:id])
  end

  # POST /statics
  # POST /statics.xml
  def create
    @static = Static.new(params[:static])

    respond_to do |format|
      if @static.save
        format.html { redirect_to(@static, :notice => I18n.t('actions.success.create', :model => @static.title)) }
        format.xml { render :xml => @static, :status => :created, :location => @static }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @static.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statics/1
  # PUT /statics/1.xml
  def update
    @static = Static.find(params[:id])

    respond_to do |format|
      if @static.update_attributes(params[:static])
        format.html { redirect_to(@static, :notice => I18n.t('actions.success.update', :model => @static.title)) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @static.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statics/1
  # DELETE /statics/1.xml
  def destroy
    @static = Static.find(params[:id])
    @static.destroy

    respond_to do |format|
      format.html { redirect_to(root_url, :notice => I18n.t('actions.success.destroy', :model => @static.title)) }
      format.xml { head :ok }
    end
  end

  def redirect_to(options = {}, response_status = {})
    options = "/#{@static.url_part}" unless options == root_url
    super(options, response_status)
  end
end

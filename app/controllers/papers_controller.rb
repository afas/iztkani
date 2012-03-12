class PapersController < ApplicationController
  # GET /papers
  # GET /papers.xml
  def index
    page = params[:page] ? params[:page].to_i : 1
    @papers = Paper.paginate(:page => page, :per_page => Paper.per_page)
    @static = Static.find_by_url_part('papers')

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @papers }
    end
  end

  # GET /papers/1
  # GET /papers/1.xml
  def show
    @paper = Paper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @paper }
    end
  end

  # GET /papers/new
  # GET /papers/new.xml
  def new
    @paper = Paper.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @paper }
    end
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.find(params[:id])
  end

  # POST /papers
  # POST /papers.xml
  def create
    @paper = Paper.new(params[:paper])

    respond_to do |format|
      if @paper.save
        format.html { redirect_to(@paper, :notice => I18n.t('actions.success.create', :model => I18n.t('activerecord.capitalize_models.paper'))) }
        format.xml { render :xml => @paper, :status => :created, :location => @paper }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @paper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /papers/1
  # PUT /papers/1.xml
  def update
    @paper = Paper.find(params[:id])
    @paper.update_to_index(params[:to_index])

    respond_to do |format|
      if @paper.update_attributes(params[:paper])
        format.html { redirect_to(@paper, :notice => I18n.t('actions.success.update', :model => I18n.t('activerecord.capitalize_models.paper'))) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @paper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.xml
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    respond_to do |format|
      format.html { redirect_to(papers_url, :notice => I18n.t('actions.success.destroy', :model => I18n.t('activerecord.capitalize_models.paper'))) }
      format.xml { head :ok }
    end
  end
end

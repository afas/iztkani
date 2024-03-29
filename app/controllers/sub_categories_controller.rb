class SubCategoriesController < ApplicationController
  before_filter :find_category

  def image
    @sub_category = SubCategory.find(params[:id])
    render :action => 'products/image'
  end

  # GET /sub_categories
  # GET /sub_categories.xml
  def index
    @categories = Category.all
    @sub_categories = @category.sub_categories.for_user(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_categories }
    end
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.xml
  def show
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_category }
    end
  end

  # GET /sub_categories/new
  # GET /sub_categories/new.xml
  def new
    @sub_category = SubCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_category }
    end
  end

  # GET /sub_categories/1/edit
  def edit
    @sub_category = SubCategory.find(params[:id])
  end

  # POST /sub_categories
  # POST /sub_categories.xml
  def create
    @sub_category = SubCategory.new(params[:sub_category])

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to(category_sub_categories_path(@category), :notice => I18n.t('actions.success.create', :model => I18n.t('activerecord.capitalize_models.sub_category'))) }
        format.xml  { render :xml => @sub_category, :status => :created, :location => @sub_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_categories/1
  # PUT /sub_categories/1.xml
  def update
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      if @sub_category.update_attributes(params[:sub_category])
        format.html { redirect_to(category_sub_category_products_path(@sub_category.category, @sub_category), :notice => I18n.t('actions.success.update', :model => I18n.t('activerecord.capitalize_models.sub_category'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.xml
  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy

    respond_to do |format|
      format.html { redirect_to(category_sub_categories_url(@category), :notice => I18n.t('actions.success.destroy', :model => I18n.t('activerecord.capitalize_models.sub_category'))) }
      format.xml  { head :ok }
    end
  end

  private
  def find_category
    @category = Category.find(params[:category_id])
  end
end

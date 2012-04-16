class ProductsController < ApplicationController
  before_filter :find_categories

  def image
    @product = Product.find(params[:id])
  end

  # GET /products
  # GET /products.xml
  def index
    page = params[:page] ? params[:page].to_i : 1
    per_page = Product.per_page
    cproducts = @sub_category.products
    @products = cproducts.paginate(:page => page, :per_page => per_page)
    @pmax = cproducts.size
    @pfrom = (page - 1) * per_page + 1
    @pto = page * per_page
    @pto = @pmax if @pto > @pmax

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(category_sub_category_products_path(@category, @sub_category), :notice => I18n.t('actions.success.create', :model => I18n.t('activerecord.capitalize_models.product'))) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(category_sub_category_product_path(@category, @sub_category, @product), :notice => I18n.t('actions.success.update', :model => I18n.t('activerecord.capitalize_models.product'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(category_sub_category_products_path(@category, @sub_category), :notice => I18n.t('actions.success.destroy', :model => I18n.t('activerecord.capitalize_models.product'))) }
      format.xml  { head :ok }
    end
  end

  private
  def find_categories
    @sub_category = SubCategory.find(params[:sub_category_id])
    @category = Category.find(params[:sub_category_id]) if params[:category_id]
    @category = @sub_category.category if params[:category_id].nil?
  end
end

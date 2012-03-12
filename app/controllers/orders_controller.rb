class OrdersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]

  # GET /orders
  # GET /orders.xml
  def index
    page = params[:page] ? params[:page].to_i : 1
    per_page = Order.per_page
    @orders = Order.paginate(:page => page, :per_page => per_page)
    @pmax = Order.all.size
    @pfrom = (page - 1) * per_page + 1
    @pto = page * per_page
    @pto = @pmax if @pto > @pmax

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])
    @order.total_price = @cart.total_price

    respond_to do |format|
      if @order.save
        @order.add_line_items_from_cart(@cart)
        OrderMailer.new_order(@order).deliver
        session[:cart] = nil

        format.html { redirect_to(categories_path, :notice => I18n.t('actions.success.create', :model => I18n.t('activerecord.capitalize_models.order'))) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => I18n.t('actions.success.update', :model => I18n.t('activerecord.capitalize_models.order'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url, :notice => I18n.t('actions.success.destroy', :model => I18n.t('activerecord.capitalize_models.order'))) }
      format.xml  { head :ok }
    end
  end
end

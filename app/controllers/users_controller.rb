class UsersController < ApplicationController
  # GET /users/1/edit
  def edit
    @user = User.find(1)
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user = User.find(1)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(root_url, :notice => I18n.t('actions.success.update', :model => I18n.t('activerecord.capitalize_models.user'))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end

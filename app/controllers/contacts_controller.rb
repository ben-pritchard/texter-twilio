class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      respond_to do |format|
        format.html { redirect_to contacts_path }
        format.js
      end
    else
      render :new
    end
  end

  def show

    @contact = Contact.find(params[:id])
    @messages = @contact.messages
    respond_to do |format|
      format.html {redirect_to contact_path(@contact)}
      format.js
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.js
    end
  end


private
  def contact_params
    params.require(:contact).permit(:name, :number)
  end
end

class User::ContactsController < ApplicationController

  def new
     @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    セーブがうまくいかないので修正する
    if @contact.save!
      redirect_to contacts_complete_path
    else
      render :new
    end
  end

  def complete
  end

  private

  def contact_params
    params.require(:contact).permit(:contact_title, :contact_content)
  end

end

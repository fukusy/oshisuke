class User::ContactsController < ApplicationController

  def new
     @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save!
      # respond_to do |format|
        UserMailer.send_when_create.deliver_later
      # end
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

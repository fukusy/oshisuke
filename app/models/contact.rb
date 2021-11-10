class Contact < ApplicationRecord

  belongs_to :user

  enum contact_title: { add_tag: 0, about_event: 1, other:2 }

end

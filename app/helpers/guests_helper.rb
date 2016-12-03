module GuestsHelper

  def li_class_for_guest(guest)
    "present" if guest.present?
  end

  def li_for_guest(guest)
    content_tag_for :li, guest, :class => li_class_for_guest(guest) do
      yield
    end
  end

  def form_for_guest_status(guest)
    form_for([guest.list, guest]) do |f|
      f.check_box :status, :class => "toggle", :checked => guest.present?
    end
  end
end

class Meeting < ActiveRecord::Base
  scope :sent_by, ->(user) { where(invitor_id: user.id) }
  scope :sent_to, ->(user) { where(invited_id: user.id) }

  def confirm
    update_attributes(status: "confirmed")
  end

  def reject
    update_attributes(status: "rejected")
  end

  def cancel
    update_attributes(status: "canceled")
  end

  def confirmed?
    status == "confirmed"
  end

  def not_yet_confirmed?
    status == "new"
  end

  def canceled?
    status == "canceled"
  end

  def rejected?
    status == "rejected"
  end
end

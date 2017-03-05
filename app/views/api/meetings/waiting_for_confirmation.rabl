collection @waiting_meetings
attributes :id, :when, :location, :status
child :invitor do
  attributes :first_name, :looking_for
end

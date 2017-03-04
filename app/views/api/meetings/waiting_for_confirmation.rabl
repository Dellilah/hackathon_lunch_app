collection @waiting_meetings
attributes :id, :when, :location, :status
child(:invitor) { attributes :first_name }

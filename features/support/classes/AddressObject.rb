
class AddressObject

	def initialize()
	end

	def get_street
	  @street
	end

	def set_street(street)
	  @street = street
	end

	def get_city
	  @city
	end

	def set_city(city)
	  @city = city
	end

	def get_state
	  @state
	end

	def set_state(state)
	  @state = state
	end

	def get_zip
	  @zip
	end

	def set_zip(zip)
	  @zip = zip
	end

	def set_address()
	  @address = @street + " " + @city + " " + @state + " " + @zip
	end

	def get_address()
	  @address
	end
end
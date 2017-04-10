Before do
  puts "Before class"
  $addressObject = AddressObject.new()
  $vehicleObject = VehicleObject.new()
end

After do
  puts "After class"
end
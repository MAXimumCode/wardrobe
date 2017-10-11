# Класс отвечающий за одну вещь

class ClothItem
  attr_accessor :cloth_name, :cloth_type, :temp_range

  def initialize(cloth_name, cloth_type, temp_range)
    @cloth_name = cloth_name
    @cloth_type = cloth_type
    temperature_range = temp_range.delete("\(\)").split(",")
    @temp_range = temperature_range[0].to_i..temperature_range[1].to_i
  end

  def right_temp?(temp)
    temp_range.cover?(temp)
  end

  def to_s
    "#{cloth_name} (#{cloth_type}) #{temp_range}"
  end
end
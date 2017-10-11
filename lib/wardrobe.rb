# Класс одежный шкаф хранящий в себе массив одежды из директории

class Wardrobe
  attr_reader :all_clothes

  def initialize
    @all_clothes = {}
  end

  def cloth_from_dir(dir)
    dir.each do |file|
      all_clothes_array = File.new(file, "r:UTF-8").readlines

      item = ClothItem.new(
        all_clothes_array[0].chomp,
        all_clothes_array[1].chomp,
        all_clothes_array[2].chomp
      )

      if all_clothes.key?(item.cloth_type)
        all_clothes[item.cloth_type] << item
      else
        all_clothes[item.cloth_type] = Array(item)
      end
    end
  end

  def types_of_clothes
    all_clothes.keys
  end

  def clothes_by_type(cloth_type)
    all_clothes[cloth_type]
  end
end
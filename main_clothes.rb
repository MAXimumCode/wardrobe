require_relative 'lib/cloth_item'
require_relative 'lib/wardrobe'

puts 'Программа "Выбор одежды по погоде"'
puts

# Путь

file_path = "#{File.dirname(__FILE__)}/data/"

# Проверка на наличие папки с вещами

begin
  clothes_directory = Dir.glob("#{file_path}*.txt")
rescue SystemCallError
  abort 'Папка с одеждой не найдена'
end
# Проверка наличия файлов с вещами

abort "Файлы с одеждой не найдеты в директории #{file_path}" if clothes_directory.empty?

wardrobe = Wardrobe.new
wardrobe.cloth_from_dir(clothes_directory)

# Получаем инфу от пользователя
puts 'Сколько градусов за окном? (можно с минусом):'
temp = STDIN.gets.to_i

match_clothes = []

wardrobe.types_of_clothes.each do |cloth_type|
  clothes_type = wardrobe.clothes_by_type(cloth_type)
  right_temp_cloth = clothes_type.select { |item| item.right_temp?(temp)}

  if right_temp_cloth.empty?
    abort 'К сожалению не нашлось подходящей одежды'
  else
    match_clothes << right_temp_cloth.sample
  end
end

puts 'Предлогаем сегодня одеть'
puts match_clothes






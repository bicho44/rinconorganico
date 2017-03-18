# encoding: UTF-8
# long_text = "
# Here the client provides two points to the server, and uses DRbUnumped to present a DRbObject to the server, rather than sending the point across the wire, creating a copy on each side. When the server asks for each point's x and y value, it connects back to the client to retrieve them.

# This way the an object is always stored in only one place. If the server were to save the points, then recalulate them again later, the distance would still be accurate, since there is only one instance of each point in the system.

# DRbUndumped can also be used to prevent large structures from being transfered. As an example, here is a jukebox server, and a tabletop jukebox console. The tabletop consoles will allow people to select songs to play from their tables.

# The server has a list of songs, and the tabletop consoles are able to read those songs and select one to play. It doesn't make sense for the tabletop consoles to pull the entire song across the connection, so we'll only define it on the server.
# "
# long_text *=2

Category.delete_all
'Almacén, Frutas y verduras, Aceites, Vinos'.split(',').each do |c|
  Category.create!(title: c.strip)
end

f= Category.find_by_title('Frutas y verduras')
['Frutas','Verduras'].each do |t|
  Category.create!(title: t, parent_id: f.id)
end

Product.delete_all

Category.all.each do |c|
  products = [
    'zanahorias, por kg, zanahoria.jpg',
    'lechuga, por kg, lechuga.jpg',
    'esparragos, por kg, esparrago.jpg',
    'lechuga, por kg, lechuga.jpg',
    'zanahorias, por kg, zanahoria.jpg',
    'frutillas, (100 gr), frutilla.jpg'
    ].map{|x| (x.split ',').map(&:strip)}

  5.times do
    products.each do |p|
      puts p.inspect
      puts Rails.root.join('app', 'assets', 'images','seed', p[2])
      pic = open( Rails.root.join('app', 'assets', 'images','seed', p[2]))
      puts pic.inspect

      Product.create!(
        title: p[0],
        description: 'Texto simulado'*6,
        measure:  p[1],
        price: 12.00,
        picture: pic,
        category_id: c.id
        )
    end
  end
end

require 'yaml'
notes = YAML.load_file(Rails.root.join('db/seeds/notes.yml'))
notes.each {|note| Note.create!(note)}

# Recipe.delete_all

# pic = open( Rails.root.join('app', 'assets', 'images','seed', 'recipe.png'))
# 10.times do |i|
#   Recipe.create!(title: "Zanahorias Salteadas #{i}",
#     description: ('Texto simulado '*5)+'<br>'+('Texto simulado '*10),
#     picture: pic
#     )
# end

# Producer.delete_all

# names = 'Juan Marcelo Maria Jose'.split
# lastnames = 'Cieri Rodriguez Perez Gonzalez'.split
# (1..4).to_a.each do |i|
#   pic = open( Rails.root.join('app', 'assets', 'images','seed', 'producers', "#{i}.jpg"))
#   Producer.create!(
#     title: [names.sample,lastnames.sample].join(' '),
#     description: 'Texto simulado '*20,
#     picture: pic
#     );
# end

# Certification.delete_all
# pic = open( Rails.root.join('app', 'assets', 'images','seed', 'certificacion.jpg'))
# 10.times do |i|
#   Certification.create!(title:"Usda - Organic #{i}",
#     description: long_text*2,
#     picture: pic
#     )
# end

# Testimony.delete_all
# pic = open( Rails.root.join('app', 'assets', 'images','seed', 'certificacion.jpg'))
# 10.times do |i|
#   Testimony.create!(title:"Usda - Organic #{i}",
#     description: long_text,
#     picture: pic
#     )
# end

# note_pics = %w(bar1.png blog1.png catering1.png)
# note_pics *=2
# Note.delete_all
# Note.types.each do |type|
#   note_pics.each_with_index do |pic,i|
#     Note.create!(
#       title: "Nota #{i+1}",
#       type: type,
#       description: long_text,
#       picture: open( Rails.root.join('app', 'assets', 'images','seed','notes', pic))
#     )
#   end
# end


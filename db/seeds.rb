# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"




# file = URI.open('https://commons.wikimedia.org/wiki/File:NASA-Apollo8-Dec24-Earthrise.jpg#/media/File:NASA-Apollo8-Dec24-Earthrise.jpg')

LANGUAGES = ['Dart', 'Elixir', 'Go', 'Javascript', 'Python', 'Ruby']
MESURES = ['Day', 'Week', 'Month', 'Year']
STATUS = ["Not Mastered Yet", "Mastered"]


p 'destroying previous languages'
p 'destroying previous status'
p 'destroying previous mesures'

Language.destroy_all if Rails.env.development?
Mesure.destroy_all if Rails.env.development?

p 'languages destroy'
p 'mesures destroy'

p "creating the languages in"
LANGUAGES.each do |language|
  Language.create!(
    name: language
  )
end

p 'The languages have been created'


p 'creating the mesures'
MESURES.each do |mesure|
    Mesure.create!(
      name: mesure
      )
  end
 p 'The measures have been created'


 # p "creating the status in"
 # STATUS.each do |status|
 #   Status.create!(
 #     name: status
 #   )
 # end

 p 'The status have been created'


List.destroy_all if Rails.env.development?
Flashcard.destroy_all if Rails.env.development?

p "Creating 5 Lists"

TITLE = ["Learning Dart", "Getting Better at Rails", "Mastering Ruby", "JS Love", "Python for Machine Learning"]
DESCRIPTION = ["It's important to let the Feeling Brain air out all its icky, twisted feelings. Just get them out into the open where they can bring"]
PICTURE_LINKS = ["https://devstickers.com/assets/img/pro/0q2i.png", "https://devstickers.com/assets/img/cat/python.png", "https://devstickers.com/assets/img/cat/react-js.png", "https://devstickers.com/assets/img/cat/javascript.png", "https://devstickers.com/assets/img/cat/big-data.png"]
FILE_NAME = ["ruby", "js", "python", "php", "c++"]
TITLE.each do |title|
  List.create!(
    title: title,
    description: DESCRIPTION[rand(4)],
    language_id: Language.first.id,
    user_id: User.first.id
  )
  # p "hello"
  #   file = URI.open(PICTURE_LINKS[rand(4)])
  #   p "hello"
  #   list1.photo.attach(io: file, filename: `#{FILE_NAME[rand(4)]}`+'.png', content_type: 'image/png')
  # p "hello"
  # list1.save
  List.create!(
    title: title,
    description: DESCRIPTION[0],
    language_id: Language.last.id,
    user_id: User.first.id
  )
  # p"helloe"
  #   file = URI.open(PICTURE_LINKS[rand(4)])
  #   list2.photo.attach(io: file, filename: `#{FILE_NAME[rand(4)]}`+'.png', content_type: 'image/png')
  #   list2.save
end


p '5 Lists have been created'

p 'Now Creating a random number of flashcards for Lists'
  List.all.each do |list|
    10.times do
      flash = Flashcard.create!(
        question: Faker::TvShows::RickAndMorty.quote,
        solution: Faker::TvShows::RickAndMorty.quote,
        code: Faker::Markdown.inline_code,
        list_id: list.id
      )
      # flash.photo.attach(io: 'https://commons.wikimedia.org/wiki/File:NASA-Apollo8-Dec24-Earthrise.jpg#/media/File:NASA-Apollo8-Dec24-Earthrise.jpg', filename: 'nes.png', content_type: 'image/png')
    end

#   list = List.new(
#     title: TITLE[0],
#     description: DESCRIPTION[0],
#     language_id: Language.last.id,
#     user_id: User.first.id
#     )
#   file = URI.open(PICTURE_LINKS[rand(4)])
#   list.photo.attach(io:file, filename: `#{FILE_NAME[rand(4)]}` + '.png', content_type: 'image/png')
#   list.save

end

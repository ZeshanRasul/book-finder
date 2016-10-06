# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
books = [
  ["The Lord of the Rings", "J. R. R. Tolkien", "1954", "Fantasy", "The Lord of the Rings is an epic high-fantasy novel written by English author J. R. R. Tolkien. The story began as a sequel to Tolkien's 1937 fantasy novel The Hobbit, but eventually developed into a much larger work."],
  ["Pride and Prejudice", "Jane Austen", "1813", "Satire", "The story follows the main character, Elizabeth Bennet, as she deals with issues of manners, upbringing, morality, education, and marriage in the society of the landed gentry of the British Regency."],
  ["Catch-22", "Joseph Heller", "1961", "Black Humour", "The novel is set during World War II, from 1942 to 1944. It mainly follows the life of Captain John Yossarian, a U.S. Army Air Forces B-25 bombardier. Most of the events in the book occur while the fictional 256th Squadron is based on the island of Pianosa, in the Mediterranean Sea, west of Italy."],
  ["Nineteen Eighty-Four", "George Orwell", "1949", "Political Fiction", "The novel is set in Airstrip One (formerly known as Great Britain), a province of the superstate Oceania in a world of perpetual war, omnipresent government surveillance and public manipulation, dictated by a political system euphemistically named English Socialism (or Ingsoc in the government's invented language, Newspeak) under the control of a privileged elite of the Inner Party, that persecutes individualism and independent thinking as 'thoughtcrime.'"],
  ["Far From The Madding Crowd", "Thomas Hardy", "1874", "Drama", "It deals in themes of love, honour and betrayal, against a backdrop of the seemingly idyllic, but often harsh, realities of a farming community in Victorian England. It describes the farmer Bathsheba Everdene, her life and relationships - especially with her lonely neighbour William Boldwood, the faithful shepherd Gabriel Oak, and the thriftless soldier Sergeant Troy."],
  ["Of Mice and Men", "John Steinbeck", "1937", "Tragedy", "It tells the story of George Milton and Lennie Small, two displaced migrant ranch workers, who move from place to place in California in search of new job opportunities during the Great Depression in the United States."],
  ["Little Women", "Louisa May Alcott", "1868", "Coming of Age", "The novel follows the lives of four sisters—Meg, Jo, Beth, and Amy March—detailing their passage from childhood to womanhood, and is loosely based on the author and her three sisters."],
  ["The Lion, the Witch and the Wardrobe", "C.S. Lewis", "1950", "Fantasy", "Most of the novel is set in Narnia, a land of talking animals and mythical creatures that one White Witch has ruled for 100 years of deep winter. In the frame story, four English children are relocated to a large, old country house following a wartime evacuation."],
  ["War and Peace", "Leo Tolstoy", "1869", "Historical Drama", "The novel charts the history of the French invasion of Russia, and the impact of the Napoleonic era on Tsarist society, through the stories of five Russian aristocratic families."],
  ["The Count of Monte Cristo", "Alexandre Dumas", "1845", "Adventure", "The story takes place in France, Italy, and islands in the Mediterranean during the historical events of 1815–1839: the era of the Bourbon Restoration through the reign of Louis-Philippe of France. It begins just before the Hundred Days period, when Napoleon returned to power after his exile."]
]

books.each do |name, author, year, genre, description|
  Book.create(name: name, author: author, year: year, genre: genre, description: description)
end

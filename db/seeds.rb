# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

   first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
   second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
   
   first_post = Post.create(author: first_user, title: 'Post Written by Tom', text: 'This is Tom first post')
   second_post = Post.create(author: first_user, title: 'Post Written by Tom', text: 'This is Tom second post')
   third_post = Post.create(author: second_user, title: 'Post Written by Lilly', text: 'This is Lilly first post')
   fourth_post = Post.create(author: second_user, title: 'Post Written by Lilly', text: 'This is Lilly second post')

   Comment.create(posts: first_post, users: first_user, text: 'Hi Tom! 1' )
   Comment.create(posts: first_post, users: first_user, text: 'Hi Tom! 2' )
   Comment.create(posts: first_post, users: first_user, text: 'Hi Tom! 3' )
   Comment.create(posts: second_post, users: first_user, text: 'Hi Tom! 4' )
   Comment.create(posts: third_post, users: second_user, text: 'Hi Lilly! 1' )
   Comment.create(posts: fourth_post, users: second_user, text: 'Hi Lilly! 2' )
   Comment.create(posts: fourth_post, users: second_user, text: 'Hi Lilly! 3' )
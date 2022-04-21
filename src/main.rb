#!/usr/bin/env ruby
require_relative './classes/app'
require 'fileutils'

def main
  app = App.new
  loop do
    system('clear')
    puts 'Welcome to Catalog of my stuff!'
    puts
    puts "Please choose an option by entering a number:
  1 - List all books
  2 - List all music albums
  3 - List of games
  4 - List all genres (e.g 'Comedy', 'Thriller')
  5 - List all labels (e.g. 'Gift', 'New')
  6 - List all authors (e.g. 'Stephen King')
  7 - Add a book
  8 - Add a music album
  9 - Add a game
  10 - Exit"
    choice = gets.chomp.to_i

    break if app.run(choice) == 'exit'
  end

  puts "Thank you for using this app!\n\n"
end
main

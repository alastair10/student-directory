=begin 
student_count = 11
#first let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Kreuger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end 

@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def load_students
  # open the file
  file = File.open("students.csv", "r")
  # read all the lines into an array and iterate over it
  file.readlines.each do |line|
  # parallel assignment - if the value is array, first var will get first value, second var will get second value, etc.
  name, cohort = line.chomp.split(',')
  # assign the name and cohort variables and put into a new hash
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def save_students
  # opens the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    # convert hash to a string to store it to a file
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    # puts in this case writes to the file not the screen
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
        load_students
    when "9"
      exit # causes program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------" 
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

#nothing happents until we call the methods
interactive_menu
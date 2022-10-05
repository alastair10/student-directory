student_count = 11
#first let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Kreuger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------" 
end

def print(names)
  names.each do |x|
    puts x
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happents until we call the methods

print_header
print(students)
print_footer(students)
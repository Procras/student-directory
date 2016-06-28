require 'csv'
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
    action_message
  when "2"
    show_students
    action_message
  when "3"
    save_students
    action_message
  when "4"
    puts "Enter filename"
    fname = STDIN.gets.chomp
    load_students(fname)
  when "9"
    bye_message
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def action_message
  puts "Okay, I will do as you command"
end

def bye_message
  puts "Goodbye!"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
  @cohort = "november"
  # while the name is not empty, repeat this code
  while !@name.empty? do
    # add the student hash to the array
    add_students
    puts "Now we have #{@students.count} students"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
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

def save_students
  puts "Enter filename"
  filename = STDIN.gets.chomp
  CSV.open(filename, "w") do |csv|
  @students.each do |student|
    csv << [student[:name], student[:cohort]]
  end

end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
    @name, @cohort = row
    add_students
  end
else
  puts "Sorry #{filename} doesn't exist"
  exit
end

def add_students
  @students << {name: @name, cohort: @cohort.to_sym}
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


try_load_students
interactive_menu

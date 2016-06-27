def input_info
  puts "Please enter student's name and details".center(65)
  puts "Please enter name, student's hobby, country of birth, height, and cohort".center(65)
  puts "Please separate the details with a comma and a single space".center(65)
  puts "To finish, hit return twice.".center(65)

  students = []

  input = gets.chomp
  until input.empty?
    input = input.split(', ')
    students << { name: input[0], hobby: input[1], bith_place: input[2], height: input[3], cohort: input[4]}
    puts "Now we have #{students.count} students.".center(65)
    input = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(65)
  puts "--------------".center(65)
end

def print(students)
  index = 0
  while index < students.length
    puts "#{index + 1}.#{students[index][:name]} - Hobby: #{students[index][:hobby]}, Birthplace: #{students[index][:birthplace]}, Height: #{students[index][:height]} ft, Cohort: #{students[index][:cohort]}"
    index += 1
  end
end

def print_footer(students)
  puts "Overall we have #{students.length} students".center(65)
end



#nothing happens until we call the methods
students = input_info
print_header
print(students)
print_footer(students)

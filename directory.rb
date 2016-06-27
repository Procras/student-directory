def input_info
  puts "Please enter student's name and details".center(65)
  puts "Please enter name, student's hobby, country of birth, height, and cohort".center(65)
  puts "Please separate the details with a comma and a single space".center(65)
  puts "To finish, hit return twice.".center(65)

  students = []

  input = gets.delete("\n")
  until input.empty?
    input = input.split(', ')
    students << { name: input[0], hobby: input[1], bith_place: input[2], height: input[3], cohort: input[4]}
    if students.length > 1
    puts "Now we have #{students.count} students.".center(65)
  else
    puts "Now we have #{students.count} student."
  end
    input = gets.delete("\n")
  end
  students
end


def print_header
  puts "The students of Villains Academy".center(65)
  puts "--------------".center(65)
end

def print(students)
  index = 0
  students.map do |hash|
    if !students[index][:name].empty?
    puts "#{index + 1}.#{students[index][:name]} - Hobby: #{students[index][:hobby]}, Birthplace: #{students[index][:birthplace]}, Height: #{students[index][:height]} ft, Cohort: #{students[index][:cohort]}"
  else
    puts "If name(s) not displayed, it is because you forgot to enter it!".center(65)
    index += 1
  end
end
end

def print_footer(students)
  if students.length > 1
  puts "Overall we have #{students.length} students".center(65)
else
  puts "Overall we have #{students.length} student"
end
end



#nothing happens until we call the methods
students = input_info
print_header
print(students)
print_footer(students)

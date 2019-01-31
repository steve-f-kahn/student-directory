def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
	students
end

def print_header
  puts "The students of Villains Academy who names are shorter then 12 characters"
  puts  "-------------"
end

def print(students)
  track = 0
  while track < students.count 
    if students[track][:name].length < 12
      puts "#{track+1}. #{students[track][:name]} (#{students[track][:cohort]} cohort)" 
    end
    track += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students "
end

students = input_students
print_header
print(students)
print_footer(students)
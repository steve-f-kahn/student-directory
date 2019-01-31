def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chomp
  cohort = gets.chomp.to_sym
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp if !name.empty?
  end
	students
end

def print_header
  $header = "The students of Villains Academy who names are shorter then 12 characters"
  puts $header
  puts  "-------------".center($header.length)
end

def print(students)
  track = 0
  while track < students.count 
    if students[track][:name].length < 12
      puts "#{track+1}. #{students[track][:name]} (#{students[track][:cohort]} cohort)".center($header.length)
    end
    track += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students ".center($header.length)
end

students = input_students
print_header
print(students)
print_footer(students)
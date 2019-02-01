require "csv"
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "Then their cohort"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp
  while !name.empty? do
    add_students(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp if !name.empty?
  end
end

def print_header
  puts "The students of Villains Academy"
  puts  "-------------"
end

def print_student_list
 @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students "
end

def interactive_menu
  
  loop do 
    print_menu
    process(STDIN.gets.chomp)
    success
    
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
      load_students(gets.chomp)
    when "9"
      exit
    else 
      puts "I don't know what you meant, try again"
  end
end

def save_students
  CSV.open(gets.chomp.to_s, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name],student[:cohort]]
    end
  end
end

def load_students(filename = "students.csv")
  CSV.foreach("students.csv","r") do |row|
    name, cohort = row
    add_students(name, cohort)
  end
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
    return 
  end 
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry #{filename} dosen't exist."
    exit
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def success
  puts "Action completed successfully"
end 

try_load_students
interactive_menu


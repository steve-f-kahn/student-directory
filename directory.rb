def input_students
  puts "Please enter the names of the students and their cohort"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.strip
  cohort = gets.strip.to_sym
  while !name.empty? do
    students << {name: name, cohort: cohort}
    if !students.count == 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    name = gets.strip
    cohort = gets.strip.to_sym if !name.empty?
  end
	students
end

def print_header
  $header = "The students of Villains Academy who names are shorter then 12 characters"
  puts $header
  puts  "-------------".center($header.length)
end

def print(students)
  cohort = {
    :January => [],
    :Febuary => [],
    :March => [],
    :April => [],
    :May => [],
    :June => [],
    :July => [],
    :August => [],
    :September => [],
    :October => [],
    :November => [],
    :December => []
  }
  students.each do |student|
    case student[:cohort]
      when :January
        cohort[:January] << student[:name]
      when :Febuary
        cohort[:Febuary] << student[:name]
      when :March
        cohort[:March] << student[:name]
      when :April
        cohort[:April] << student[:name]
      when :May
        cohort[:May] << student[:name]
      when :June
        cohort[:June] << student[:name]
      when :July
        cohort[:July] << student[:name]
      when :August
        cohort[:August] << student[:name]
      when :September
        cohort[:September] << student[:name]
      when :October
        cohort[:October] << student[:name]
      when :November
        cohort[:November] << student[:name]
      when :December
        cohort[:December] << student[:name]
      end
  end
  index = 1
  cohort.each do |month, student|
    student.each do |name|
      if name.length < 12
        puts "#{index}. #{name} (#{month} cohort)".center($header.length)
        index += 1
      end
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students ".center($header.length)
end

students = input_students
print_header
print(students)
print_footer(students)
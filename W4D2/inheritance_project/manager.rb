require_relative "./employee.rb"

class Manager < Employee
    attr_reader :employees
    attr_writer :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)

        queue = []

        total_salaries = 0

        current_manager = self
        queue.unshift(current_manager) 

        until queue.empty?
            
            el = queue.pop

            if el.is_a?(Manager) && el.employees.length > 0
                
                el.employees.each do |child|
                    queue.unshift(child) 
                    total_salaries += child.salary 
                end                     
            end
                                                   
            
        end
        total_salaries * (multiplier)
    end

end

# ned = Manager.new("Ned","Founder", 1000000, nil)
# darren = Manager.new("Darren", "TA Manager", 78000, ned)
# shawna = Employee.new("Shawna", "TA", 12000, darren)
# david = Employee.new("David", "TA1", 10000, darren)


# ned.employees << darren
# darren.employees << shawna
# darren.employees << david




# p ned.bonus(5)
# p darren.bonus(4)
# p david.bonus(3)

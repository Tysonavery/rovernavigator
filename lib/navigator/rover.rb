module Navigator
  class Rover
  
    attr_reader :x_position, :y_position, :direction_facing

    def initialize(messenger,x,y,direction_facing)
      @messenger = messenger
      @x_position = x
      @y_position = y
      @direction_facing = direction_facing
      @directions = ["North","East","South","West"]
    end
        
    def current_position
      @current_position = {"x_position" => @x_position, "y_position" => @y_position, "direction_facing" => @direction_facing}
    end
    
    def move(instructions)
    
      instructions.chars.to_a.each do |instruction|
        case instruction
          when "L" then self.turn_left
          when "R" then self.turn_right
          when "M" then self.move_forward
        end
      end      
      
    end

    #By storing 'directions' in an array, the program can cycle through directions, like a clock with four points.
    #This makes the left and right turns simple to achieve based on applying +1 or -1 to the index of the directions array.
    
    def turn_left
      direction_id = @directions.find_index(@direction_facing) #Find id for current direction
      #point the direction of the direction id before the current unless at front of the array
      #@direction_facing = (direction_id == 0) ? @directions[@directions.length -1] : @directions[direction_id -1] 
    end    
    
    def turn_right
      direction_id = @directions.find_index(@direction_facing) #Find id for current direction
      #point the direction of the direction id after the current unless at the end of the array
      #@direction_facing = (direction_id == @directions.length - 1) ? @directions[0] : @directions[direction_id + 1]
    end    
   
    def move_forward
      #Makes the Rover move forward in the direction the rover is currently facing
      case direction_facing
        when "North" then @y_position = @y_position + 1
        when "South" then @y_position = @y_position - 1            
        when "East"  then @x_position = @x_position + 1
        when "West"  then @x_position = @x_position - 1            
      end    
    end 
            
  end
end
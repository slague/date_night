#describe nodes here and then call this class in the other file date-night 
class Node

# what do all nodes have? 
    #1. They have a data element, score and movie title  
    #2 . They have a left pointer
    #3. They have a right pointer 

  attr_accessor :left, :right
  attr_reader :score, :title 
 
  def initialize(score, title)  
    @score = score 
    @title = title
    @left = nil 
    @right = nil

  end 

def insert(new_score, new_title)
  if @score == new_score
    "Do not insert"
  elsif new_score < score 
    if left.nil?
      @left = Node.new(new_score, new_title)
    else
      @left.insert(new_score, new_title)
    end
  else 
    if right.nil? 
      @right = Node.new(new_score, new_title)
    else
      @right.insert(new_score, new_score) 
    end
  end
end

def include?(score)
  if @score == score
    true
  else 
    if @left.nil? && @score > score
      false
    elsif @right.nil? && @score < score
      false 
    elsif @score > score
      @left.include?(score)
    else
      @right.include?(score)
    end
  end
end 


def depth_of(score)
  if @score == score 
    0
  else
    if @score > score
      1 + @left.depth_of(score)
    else 
      1 + @right.depth_of(score)
    end
  end 
end 
  

def max 
max = {}
  if @right.nil?
    max[@title] = @score
    max
  else 
    @right.max
  end 
end

def min 
min = {}
if @left.nil?
  min[@title] = @score
  min 
else
  @right.max
end 
end 

# def sorted_node(score) 
#   if @score == score 
#     {title => score}
#   else 
#   end 
# end 




def is_leaf?
    @left.nil? && @right.nil? 
end 

end
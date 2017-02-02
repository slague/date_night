#I am creating a list of movies called "created for you"
#The list is made up of movies and scores, 

# Each movie has a specific score 
# scores will be between 1-100
# No two movies have the same score - does this mean my list cannot be larger than 100? 

# When a new movie is added to the list, it is done so with its score 
# the score tells you how likely a user is to like that movie 

#Take new movies that have already been assigned a score, and store them in a binary tree

#A binary search tree:
  #has nodes
    #a node has a left pointer, a right pointer, and a data element 
    #nodes to the left of a node are less than or equal tothe that node, 
    #nodes to the right are greater than

#the size of the search tree is the number of nodes
# the depth of the tree is 

require './lib/node'
require 'pry'

class BinarySearchTree

attr_accessor :root_node

def initialize # root_node is the first node inserted into the tree
  @root_node = nil
  @total_nodes = 0 
end

# adds a new node with the passed-in data. (score and movie title)
def insert(score, title)
  @total_nodes +=1 
  if @root_node.nil?
     @root_node = Node.new(score, title)
  else
     @root_node.insert(score, title)
  end
  depth_of(score) 
end
 
# Verify/reject the presence of a score in the tree, (is this node in the tree?)
# returns true or false 
def include?(score) 
  if @root_node.nil?
     false
  else
    @root_node.include?(score)
  end
end

# Reports the depth of the node in the tree
# If the node is not in the tree, returns nil
def depth_of(score)
  if include?(score) #This is calling the method on line 44
    1 + @root_node.depth_of(score) 
  else 
    nil
  end 
end 

def max
  max = {}
  if @root_node.right.nil?
    max[@title] = @score
    max
  else
     @root_node.right.max
  end
end 

def min
  min = {}
  if root_node.left.nil?
    min[@title] = @score
    min
  else
    @root_node.left.min
  end 
end 


def traverse(current_node, sorted, position)
	if current_node.nil? != true 
		traverse(current_node.left, sorted, position)
    sorted.insert(position +1, {current_node.title => current_node.score})
		traverse(current_node.right, sorted, position)
	end
end 

def sort
	sorted=[]
  traverse(@root_node, @sorted, 0)
  sorted 
end


def load(file)
  movies = File.open(file, 'r')
  movie_array = movies.read.split("\n")
  existing_nodes = @total_nodes 
  movie_array.each do |movie|
    
    if @root_node.nil?
       @root_node = Node.new(movie.split(', ', 2)[0].to_i, movie.split(', ', 2))
    else
      if @root_node.insert(movie.split(', ', 2)[0].to_i, movie.split(', ', 2)) == "Do not insert"
      else 
      @total_nodes += 1
      end
    end
end 
  @total_nodes - existing_nodes  
end 
end 



  tree = BinarySearchTree.new
  tree.insert(50, "Jaws")
  tree.insert(20, "Titanic")
  tree.insert(80, "Star Wars")
  tree.insert(10, "Lion King")
  p tree.sort



# def health 
# # score of the node
# # Total number of child nodes including the current node
# # Percentage of all thec nodes that are this node or it’s children
# # returns an Array with one nested array per node at that level
# # eg [score in the node, 1 + number of child nodes, floored percentage of (1+children) over the total number of nodes]
# end 

# def height
# #what is the maximum depth_of the tree?  
# end 

# tree = BinarySearchTree.new

# tree.insert(61, "Bill & Ted's Excellent Adventure")
# tree.insert(16, "Johnny English")
# tree.insert(92, "Sharknado 3")
# tree.insert(50, "Hannibal Buress: Animal Furnace")

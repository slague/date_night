require 'minitest/autorun'
require './lib/date_night'
require './lib/node'
require 'minitest/pride' 
require 'pry'


class DateNightTest < Minitest::Test

  def test_insert
    tree = BinarySearchTree.new
    tree.insert(50, "Jaws")
    tree.insert(20, "Titanic")
    tree.insert(80, "Star Wars") 
    assert_equal 1, tree.insert(50, "Jaws")
    assert_equal 2, tree.insert(20, "Titanic")
    assert_equal 2, tree.insert(80, "Start Wars")
  end
  
  def test_include?
    tree = BinarySearchTree.new
    tree.insert(50, "Jaws")
    tree.insert(20, "Titanic")
    assert tree.include?(50)
    refute tree.include?(70)
  end 

# Reports the depth of the node in the tree
# #if the node is not in the tree, returns nil
  def test_depth_of
    tree = BinarySearchTree.new
    tree.insert(50, "Jaws")
    tree.insert(20, "Titanic")
    tree.insert(80, "Star Wars")
    tree.insert(10, "Lion King")
  assert_equal 1, tree.depth_of(50)
  assert_equal 3, tree.depth_of(10)
  assert_nil tree.depth_of(15)
  assert_equal 2, tree.depth_of(20)
  end
end

  def test_max
    tree = BinarySearchTree.new
    tree.insert(50, "Jaws")
    tree.insert(20, "Titanic")
    tree.insert(80, "Star Wars")
    tree.insert(10, "Lion King")
    assert_equal ({"Star Wars" => 80}), tree.max
# returns highest title and score, eg  => {"Sharknado 3"=>92}
  end 

def test_min
  tree = BinarySearchTree.new
  tree.insert(50, "Jaws")
  tree.insert(20, "Titanic")
  tree.insert(80, "Star Wars")
  tree.insert(10, "Lion King")
  assert_equal ({"Lion King" => 10}), tree.min
#     # returns lowest title and score, eg  => {"Sharknado 3"=>92}


def test_sort 
  tree = BinarySearchTree.new
  tree.insert(50, "Jaws")
  tree.insert(20, "Titanic")
  tree.insert(80, "Star Wars")
  tree.insert(10, "Lion King")
  assert_equal [{"Lion King" => 10}, 
                {"Titanic" => 20},
                {"Jaws" => 50},
                {"Star Wars" => 80}], tree.sort
end 
 


def test_load
  tree = BinarySearchTree.new
  assert_equal  99, tree.load('./lib/movies.txt')
end 
# #make a text file called movies.txt
# # #this file has one score/movie per line 
# #the return value is the number of movies inserted the tree


#   def test_health 
#     # score of the node
# # Total number of child nodes including the current node
# # Percentage of all the nodes that are this node or it’s children
# # returns an Array with one nested array per node at that level
# # eg [score in the node, 1 + number of child nodes, floored percentage of (1+children) over the total number of nodes]

#   end 

#   def test_height 
#     #what is the maximum depth_of the tree?  
#   end

end 

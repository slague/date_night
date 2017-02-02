require 'minitest/autorun'
require './lib/date_night'
require './lib/node'
require 'minitest/pride' 


class NodeTest < Minitest::Test
  def test_if_node_works 
    node = Node.new(100, "Jaws")
    assert_equal 100, node.score
    assert_equal "Jaws", node.title  
    assert_nil node.left
    assert_nil node.right
  end 

def test_insert
   node = Node.new(100, "Jaws")
  
   assert_equal  20, "Titanic", node.insert(20, "Titanic")

end

def test_include?
  
end


def test_depth_of 
  

end

def test_sorted_node 
end 

def test_is_leaf?
end 

end
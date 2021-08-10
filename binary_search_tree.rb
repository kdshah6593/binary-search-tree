class BST
    attr_accessor :data, :left, :right
    
    def initialize(data)
        self.data = data
    end

    def insert(value)
        if value <= self.data && self.left == nil
            self.left = BST.new(value)
        elsif value <= self.data && self.left
            self.left.insert(value)
        elsif value > self.data && self.right == nil
            self.right = BST.new(value)
        else
            self.right.insert(value)
        end
    end

    # The each method takes a block as argument. In this case the block is { |data| all_data << data }. The each method uses recursion to go down the left and right nodes
    # of the tree. Each time each is called, if if hits a node with no left, it will call the data, then it will check all the right nodes. Then it will come back up until it
    # can go back down again

    def each(&block)
        self.left.each(&block) if self.left
        block.call(data)
        self.right.each(&block) if self.right
    end



end
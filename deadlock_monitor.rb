class DeadlockMonitor
    attr_accessor :array

    def initialize(size)
        @size = size
        @array = []
    end

    def push(path)
        array.shift(1) if array.count > @size
        array << path
    end

    def locked?        
        if array.count == @size
            counts_arr = array.group_by(&:href).values.map(&:count)
            avg = counts_arr.reduce(0){|sum, e| sum += e} / counts_arr.count
            counts_arr.all?{|e| (e - avg).abs < @size / counts_arr.count }
        else
            false
        end
    end
end
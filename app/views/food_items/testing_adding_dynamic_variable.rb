def make_variables

  @i = 0
      Foods.each do |f|
        @i = f._id
        @empty_array = []
        instance_variable_set("@food_variable#{@i}")
        @empty_arrray.push(@i)
        puts @i
      end
end
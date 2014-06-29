require 'green_shoes'

Shoes.app height: 50, width: 230 do
	flow margin: 5 do
		@clock = title ''
		animate do
			t = Time.new
		  @clock.text = bg(fg(t.strftime("%H:%M:%S"), rgb(0, 255, 0)), black)
		end
	end
end

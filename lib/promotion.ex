# defmodule Promotion do
#   def discount([]), do: 0
#   def discount([_]), do: 0
#   def discount(products) when length(products) == 2, do: 1
#   def discount(products) when length(products) <= 5, do: 2
#   def discount(products) when length(products) <= 10, do: 3
#   def discount(_), do: 5
# end

defmodule Promotion do
  def discount(products) do
    cond do
      length(products) > 10 -> 5
      length(products) > 5 -> 3
      length(products) > 2 -> 2
      length(products) == 2 -> 1
      true -> 0
    end
  end
end

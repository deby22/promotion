defmodule Promotion do
  def discount([]), do: 0
  def discount([_]), do: 0
  def discount(products) when length(products) == 2, do: 1
  def discount(products) when length(products) <= 5, do: 2
  def discount(products) when length(products) <= 10, do: 3
end

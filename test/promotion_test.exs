defmodule PromotionTest do
  use ExUnit.Case
  doctest Promotion


  # 1 product - 0%
  # 2 products - 1%
  # 3-5 products - 2%
  # 5-10 products - 3 %
  # 10 products and - 5%

  describe "default discount" do
    test "no product shouldn't accept promotion" do
      assert 0 == Promotion.discount([])
    end
    test "1 product shouldn't accept promotion" do
      product = %{name: "Elixir course", price: 10.0}
      assert 0 == Promotion.discount([product])
    end
  end

end

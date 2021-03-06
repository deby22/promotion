defmodule PromotionTest do
  use ExUnit.Case
  doctest Promotion


  # 1 product - 0%
  # 2 products - 1%
  # 3-5 products - 2%
  # 6-10 products - 3 %
  # 11 products and - 5%

  describe "default discount" do
    test "no product shouldn't accept promotion" do
      assert 0 == Promotion.discount([])
    end
    test "1 product shouldn't accept promotion" do
      product = %{name: "Elixir course", price: 10.0}
      assert 0 == Promotion.discount([product])
    end
    test "2 products should give 1% promotion" do
      product = %{name: "Elixir course", price: 10.0}
      assert 1 == Promotion.discount([product, product])
    end
    test "3 to 5 products should give 2% promotion" do
      for n <- [3, 4, 5] do
        promotion =
          %{name: "Elixir course", price: 10.0}
          |> List.duplicate(n)
          |> Promotion.discount()

        assert 2 == promotion
      end
    end
    test "5 to 10 products should give 3% promotion" do
      for n <- 6..10 do
        promotion =
          %{name: "Elixir course", price: 10.0}
          |> List.duplicate(n)
          |> Promotion.discount()

        assert 3 == promotion
      end
    end
    test "more than 10 products should give 5% promotion" do
      for n <- 11..50 do
        promotion =
          %{name: "Elixir course", price: 10.0}
          |> List.duplicate(n)
          |> Promotion.discount()

        assert 5 == promotion
      end
    end
  end

end

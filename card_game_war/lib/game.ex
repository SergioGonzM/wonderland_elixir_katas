defmodule CardGameWar.Game do

  # feel free to use these cards or use your own data structure"
  def suits, do: [:spade, :club, :diamond, :heart]
  def ranks, do: [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

  defmodule Card do
    defstruct [:suit, :rank]
  end
 
  def cards do
    for suit <- suits(),
        rank <- ranks() do
      %Card{suit: suit, rank: rank} end
  end

  def hand_out_cards do 
    {deck_player1, deck_player2} = Enum.shuffle(CardGameWar.Game.cards) |> Enum.split(26)
    IO.inspect(deck_player1)
    IO.inspect(deck_player2)
    play(26, 26, deck_player1, deck_player2)
  end

  def get_higher_cart(card_p1, card_p2) do
    rank_card1 = Enum.find_index(ranks, fn x -> x == card_p1.rank end)
    rank_card2 = Enum.find_index(ranks, fn x -> x == card_p2.rank end)

    suit_card1 = Enum.find_index(suits, fn x -> x == card_p1.suit end)
    suit_card2 = Enum.find_index(suits, fn x -> x == card_p2.suit end) 

    cond do
      rank_card1 > rank_card2 -> card_p1
      rank_card2 > rank_card1 -> card_p2
      true -> 
        cond do
          suit_card1 > suit_card2 -> card_p1
          true -> card_p2
        end
    end
  end

  def play(0, _, _, _), do: "El jugador 2 es el ganador"
  def play(_, 0, _,_ ), do: "El jugador 1 es el ganador" 
  def play(_, _, deck_player1, deck_player2) do
    deck_player1 = deck_player1 |> List.flatten()
    deck_player2 = deck_player2 |> List.flatten()
    IO.puts("Al jugador 1 le quedan: #{length(deck_player1)}cartas y al jugador 2 le quedan #{length(deck_player2)}")

    [card_p1 | deck_player1] = deck_player1
    [card_p2 | deck_player2] = deck_player2 

    IO.puts("Jugador 1: #{card_p1.rank}, #{card_p1.suit} vs Jugador 2: #{card_p2.rank}, #{card_p2.suit}")
    
    cond do
      get_higher_cart(card_p1, card_p2) == card_p1 -> IO.puts("El jugador 1 gano el round\n")
      deck_player1 = List.insert_at(deck_player1, -1, card_p1)
      deck_player1 = List.insert_at(deck_player1, -1, card_p2)
      play(length(deck_player1), length(deck_player2), deck_player1, deck_player2)
      
      true -> IO.puts("El jugador 2 gano el round\n")
      deck_player2 = List.insert_at(deck_player2, -1, card_p2)
      deck_player2 = List.insert_at(deck_player2, -1, card_p1)
      play(length(deck_player1), length(deck_player2), deck_player1, deck_player2)
    end
  end
end

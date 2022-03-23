defmodule Doublets.SolverTest do
  use ExUnit.Case
  import Doublets.Solver

  test "with word links found" do
    assert ["head", "heal", "teal", "tell", "tall", "tail"] ==
           doublets("head", "tail")

    assert ["door", "boor", "book", "look", "lock"] ==
           doublets("door", "lock")

    assert ["bank", "bonk", "book", "look", "loon", "loan"] ==
           doublets("bank", "loan")

    assert ["wheat", "cheat", "cheap", "cheep", "creep", "creed", "breed", "bread"] ==
           doublets("wheat", "bread")
  end

  test "with no word links found" do
    assert [] == doublets("ye", "freezer")
  end

  #find_solution
  test "find solution returns nil if not the real solution" do
       assert nil == find_solution([["bank"]], "loan")
  end

  test "find solution is the real solution and returns the list with the solution" do
       assert ["bank", "bonk", "book", "look", "loon", "loan"] == 
              find_solution([["bank", "bonk", "book", "look", "loon", "loan"] ] , "loan")  
  end

  #complete_seq_variants
  test "returns a list with the new variant of the last word in the list" do
       assert [["bank", "bonk"]] ==
              complete_seq_variants(["bank"])

       assert [["bank", "bonk", "book"]] == 
              complete_seq_variants(["bank", "bonk"])
  end

  test "returns a new list inside the original list for each variant of the word" do
       assert [["cheap", "cheat"], ["cheap", "cheep"]] ==
              complete_seq_variants(["cheap"])
       
       assert [["book", "boor"], ["book", "look"], ["book", "bonk"]] ==
              complete_seq_variants(["book"])
  end

  #find_variants
  test "find 1 variants of the given word by changing 1 letter" do
       assert ["boor"] == find_variants("door")
  end

  test "find more than 1 variant of the given word" do
       assert ["creep", "breed"] == find_variants("creed")
  end
  #same_length_words
  test "filters all the words with the same length of the given word" do
       assert ["ye"] == same_length_words("aa")

       assert ["muta", "task", "quat", "head", "heal", "teal", "tall", "tail", "door", "boor",
       "book", "look", "lock", "bank", "bonk", "loon", "loan"] ==
              same_length_words("tell")

       assert ["liken", "impar", "untie", "wheat", "cheat", "cheep", "creep", "creed",
       "breed", "bread"] ==
              same_length_words("cheap")
  end

  test "if no word has the same lenght of the given word returns an empty list" do
       assert [] == same_length_words("the")
  end

  #distance, returns the difference of characters given 2 different words
  test "1 character of diference" do
       assert 1 == distance("bank", "bonk")
  end

  test "5 character of diference" do
       assert 5 == distance("untie", "breed")
  end

  #last_word
  test "filters the last word of a given list" do
       assert "bread" == last_word(["liken", "impar", "untie", "wheat", "cheat", "cheep", "creep", "creed",
       "breed", "bread"])

       assert "book" == last_word(["bank", "bonk", "book"])
  end
  
end

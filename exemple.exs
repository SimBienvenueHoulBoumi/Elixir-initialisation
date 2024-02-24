# afficher une message
IO.puts("Hello world from Elixir")

IO.puts(div(5, 2))

# return false
IO.puts(is_number("1"))

# return length of string
IO.puts(String.length("Hello world from elixir"))

# return string in uppercase
IO.puts(String.upcase("Hello world from elixir"))

### List et tupes

# definition d'une liste
[1, 2, "toto", true]

# definition d'une variable qui est ici une liste
list1 = [3, 4, false]

# joindre deux listes
jointure_de_list = [1, 2, "toto", true] ++ [3, 4, false]

# recuperation de la donnée dans une variable
longueur_list1 = length(jointure_de_list)

# return la longueur de la liste
IO.puts(longueur_list1)
IO.puts(length(list1))

# declarer un tableau
tab = [1, 2, 3]

# retourner longueur du tableau
IO.puts(~c"ancienne longueur")
IO.puts(length(tab))

# ajouter un element a un tableau
tab = tab ++ [4, 5]

# retourner la longueur tableau
IO.puts(~c"nouvelle longueur")
IO.puts(length(tab))

#  declarer un tuples [peut contenir des elements de types differents]
tuple_ = {:ok, "hello"}

# affiche un element d'un tuple
IO.puts(elem(tuple_, 0))

# retourne la taille du tuple
IO.puts(tuple_size(tuple_))

# modifier un element au tuple (ecrase l'ancien et le remplace par le nouveau)
tuple_ = put_elem(tuple_, 0, "toto")

IO.puts(elem(tuple_, 0))

# decomposer des tuples
{name, password} = {"sim", "admin"}
IO.puts("name: ")
IO.puts(name)
IO.puts("password: ")
IO.puts(password)

# conditions
tuple_a = {1, 4, 3}

case tuple_a do
  {1, x, 3} when x > 0 ->
    IO.puts("Will match")

  _ ->
    IO.puts("Would match, if guard condition were not satisfied")
end

condition_init = false

case condition_init do
  true ->
    IO.puts("Boolean will match")

  false ->
    IO.puts("Boolean would match, if guard condition were not satisfied")
end

if condition_init do
  IO.puts("Boolean condition will match")
else
  IO.puts("Boolean condition would match, if guard condition were not satisfied")
end

# Fonctions
add = fn a, b -> a + b end

IO.puts("add fonction 1 + 2")
# appel et utilisation de la fonction
IO.puts(add.(1, 2))

# utilisation d'une fonction dans une autre
double = fn a -> add.(a, a) end
IO.puts("appel d'une fonction dans une autre")
IO.puts(double.(2))

# fonction conditionnée
division = fn x, y when y != 0 ->
  if y < 0 do
    IO.puts("division impossible")
  else
    x / y
  end
end

IO.puts("appel d'une fonction division")
IO.puts(division.(4, -4))

afficheBonjourPersonnalise = fn x ->
  IO.puts("Bonjour #{x}")
end

IO.puts("appel d'une fonction personnalisée")
IO.puts(afficheBonjourPersonnalise.(~c"sim"))

IO.puts(String.codepoints("👩‍🚒"))
IO.puts(String.graphemes("👩‍🚒"))

IO.puts("chaines de caracteres")
name = "sim"
IO.puts(~c"#{name}")

# creation d'un module (un module peut être comparé a une class)
defmodule Calculator do
  # private function
  defp function_secret_name() do
    IO.puts("++++ calculate ++++")
  end

  def sum(a, b) do
    function_secret_name()
    IO.puts(a + b)
  end
end

# fonction avec valeur par defaut
defmodule ValeurDefaut do
  def sayHello(name \\ "sim") do
    "Hello #{name}"
  end
end

defmodule Concat do
  def jointures(a \\ nil, b \\ nil, c \\ "bonjour")

  def jointures(a, b, _c) when is_nil(b) do
    a
  end
end

# Utilisation d'une fonction d'un module
Calculator.sum(1, 2)

IO.puts(ValeurDefaut.sayHello())
IO.puts(ValeurDefaut.sayHello("**** simbie ****"))

IO.puts(Concat.jointures("tata"))

# Recurcivité
# appel de la même fonction tant que la condition est vraie
defmodule Recursion do
  def print_multiple_times(msg, n) when n > 0 do
    IO.puts(msg)
    print_multiple_times(msg, n - 1)
  end

  def print_multiple_times(_msg, 0) do
    :ok
  end
end

@doc """
  Recurcivité
"""
defmodule Math do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end

IO.puts(Math.sum_list([1, 2, 3], 0))

Recursion.print_multiple_times("recursion", 5)

#src # This is needed to make this run as normal Julia file:
using Markdown #src

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
###  Let's get our hands dirty!

This notebook give a brief crash course getting you started with the basics of Julia.
"""



#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
###  Running this notebook

**Local install:**
- clone or download this notebook from https://github.com/mauro3/EGU2025-Julia-intro-and-showcase-for-geoscience
- run this to make sure packages are installed (this may take a while):
"""
## using Pkg; Pkg.instantiate()

md"""
**Google Colab**:
- head to the README of [github.com/mauro3/EGU2025-Julia-intro-and-showcase-for-geoscience](https://github.com/mauro3/EGU2025-Julia-intro-and-showcase-for-geoscience?tab=readme-ov-file#running-on-google-colab)
- click on the link for the notebook you want to start up on Colab. This one is [`julia-basics.ipynb`](https://colab.research.google.com/github/mauro3/EGU2025-Julia-intro-and-showcase-for-geoscience/blob/main/intro-notebooks/julia-basics.ipynb#scrollTo=hauaC-M8PtMP)
- in the menu "Runtime"->"Change runtime type"->"Julia" (no, leaving it at "Julia v10.9" does not work...)
- no need to install packages as what we use here is pre-intsalled on Colab (i.e. Plots.jl)
"""

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
###  Let's get our hands dirty!

We will now look at
- variables and types
- control flow
- functions
- modules and packages
"""

md"""
The documentation of Julia is good and can be found at [https://docs.julialang.org](https://docs.julialang.org); although for learning it might be a bit terse...

There are also tutorials, see [https://julialang.org/learning/](https://julialang.org/learning/).

Furthermore, documentation can be gotten with `?xyz`.  Try it (in Jupyter notebooks this needs to be in a cell of its own):
"""

## ?cos

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
## Variables, assignments, and types [5min]
[https://docs.julialang.org/en/v1/manual/variables/](https://docs.julialang.org/en/v1/manual/variables/)
"""

a = 4
b = "a string"
c = b # now b and c bind to the same value

md"""
Conventions:
- variables are (usually) lowercase, words can be separated by `_`
- function names are lowercase
- modules, packages and types are in CamelCase
"""

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
### Variables: Unicode
From [https://docs.julialang.org/en/v1/manual/variables/](https://docs.julialang.org/en/v1/manual/variables/):

Unicode names (in UTF-8 encoding) are allowed and typed in LaTeX notation.  Try making a variable
- `δ = 99` with `\delta`+tab
- `x² = 25` with `x\^2`+tab

**Note for Colab**: unicode input in Colab does not work yet. As a work around, you can input it as
described above in a text-field and then copy it to a code-field. https://github.com/googlecolab/colabtools/issues/5218
"""

#hint ## ...
δ = 99 #sol
x² = 25 #sol

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
### Basic datatypes
- numbers (Ints, Floats, Complex, etc.)
- strings
- tuples
- arrays
- dictionaries
"""

1     # 64 bit integer (or 32 bit if on a 32-bit OS)
1.5   # Float64
1//2  # Rational
#-
typeof(1.5)
#-
"a string", (1, 3.5) # and tuple
#-
[1, 2, 3,] # array of eltype Int
#-
Dict("a"=>1, "b"=>cos)


#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
## Array exercises [3min]

Arrays are the bread and butter of science...

- indexing starts at 1
- uses `[]`
- are column-major (like Fortran and Matlab, unlike C and Python)
"""

# Task: assign vectors to `a`, and `b` and the concatenate them using `;`:

a = [2, 3]
#hint b = ...
#hint [... ;... ]
b = [4, 5] #sol
[a ; b] #sol

# Add new elements to the end of Vector `b` (hint look up the documentation for `push!`)

#hint ## ?push!
push!(b, 1) #sol
push!(b, 3, 4) #sol

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Array exercise: indexing

Access element `[1,2]` and `[2,1]` of Matrix `a` (hint use []):
"""

a = rand(3,4)
#hint a[ ... ], a[ ... ]
a[1,2], a[2,1] #sol

# Linear vs Cartesian indexing,
# access the first element:

a[1]
a[1,1]

# Access the last element (look up `?end`) both with linear and Cartesian indices

#hint a[...]
#hint a[..., ...]
a[end] #sol
a[end, end] #sol

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Array exercise: indexing by ranges

Access the last row of `a` (hint use `1:end`)
"""

#hint a[... , ...]
a[end, 1:end] #sol

# Access a 2x2 sub-matrix

#hint a[...]
a[1:2, 1:2] #sol



# ################################################################

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### A small detour: types

All values have types.  Arrays store in their type what type the elements can be.

> Arrays which have concrete element-types are more performant!
"""
typeof([1, 2]), typeof([1.0, 2.0])

# Aside, they also store their dimension in the second parameter.
#
# The type can be specified at creation
String["one", "two"]

# Create an array taking `Int` with no elements.  Push `1`, `1.0` and `1.5` to it.  What happens?

#hint ## ...
a = Int[] #sol
push!(a, 1) ## works #sol
push!(a, 1.0) ## works #sol
# push!(a, 1.5) ## would error as 1.5 cannot be converted to an Int #sol

#-
# Make an array of type `Any` (which can store any value).  Push a value of type
# Int and one of type String to it.

#hint ## ...
a = [] #sol
push!(a, 5) #sol
push!(a, "a") #sol



#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
## Control flow

Julia provides a variety of [control flow constructs](https://docs.julialang.org/en/v1/manual/control-flow/), of which we look at:

  * [Conditional Evaluation](https://docs.julialang.org/en/v1/manual/control-flow/#man-conditional-evaluation): `if`-`elseif`-`else` and `?:` (ternary operator).
  * [Short-Circuit Evaluation](https://docs.julialang.org/en/v1/manual/control-flow/#Short-Circuit-Evaluation): logical operators `&&` (“and”) and `||` (“or”), and also chained comparisons.
  * [Repeated Evaluation: Loops](https://docs.julialang.org/en/v1/manual/control-flow/#man-loops): `while` and `for`.
"""

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
### Conditional evaluation
[https://docs.julialang.org/en/v1/manual/control-flow/#man-conditional-evaluation](https://docs.julialang.org/en/v1/manual/control-flow/#man-conditional-evaluation)

if-blocks
"""
a = 77
if a==45
    println("Hi")
elseif a==77
    println("Hello")
else
    println("Grüss Gott")
end

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Conditional evaluation: the "ternary operator" `?`
"""
a = 1
a > 5 ? "really big" : "not so big"

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
### Short circuit operators `&&` and `||`

[https://docs.julialang.org/en/v1/manual/control-flow/#Short-Circuit-Evaluation](https://docs.julialang.org/en/v1/manual/control-flow/#Short-Circuit-Evaluation)

Relatively often used in Julia:
```
a < 0 && error("Not valid input for `a`")
```
which evaluates the statement after `&&` only if the first statement is true.
"""

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
### Loops: `for` and `while`

[https://docs.julialang.org/en/v1/manual/control-flow/#man-loops](https://docs.julialang.org/en/v1/manual/control-flow/#man-loops)
"""

for i = 1:3
    println(i)
end

for i in ["dog", "cat"] ## `in` and `=` are equivalent for writing loops
    println(i)
end

i = 1
while i<4
    println(i)
    global i # note that this is necessary for a script but not for jupyter notebooks (soft global scope) #src
    i += 1
end


#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
## Functions

Functions can be defined in Julia in a number of ways.  In particular there is one variant
more suited to longer definitions, and one for one-liners:

```
function f(a, b)
   return a * b
end
f(a, b) = a * b
```

Defining many, short functions is typical in good Julia code.

See [https://docs.julialang.org/en/v1/manual/functions/](https://docs.julialang.org/en/v1/manual/functions/)
"""

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Functions: exercises [5min]

Define a function `fn` in long-form which takes two arguments and multiplies them
"""

#hint ## ...
function fn(a, b) #sol
    return a*b #sol
end #sol

## it should pass this test
a, b = rand(4,5), 7
@assert fn(a,b) == a*b


#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Functions: dot-syntax *IMPORTANT*

Functions which are scalar functions in maths, say `cos`, are only defined for scalars in Julia!

To apply them element-wise to vectors use `cos.([1,2])`.

Similarly the dot also works for infix functions, say `.+`.

Exercise: apply the `sin` function to a vector `1:10` and add `7`:
"""

#hint ## ...
sin.(1:10) .+ 7 #sol

# Broadcasting will extend row and column vectors into a matrix.
# Try `(1:10) .+ (1:10)'`  (Note the `'`, this is the transpose operator)

#hint ## ...
(1:10) .+ (1:10)' #sol

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Functions: dot-syntax exercise

Evaluate the function `sin(x) + cos(y)` for
`x = 0:0.1:pi` and `y = -pi:0.1:pi`.  Remember to use `'`.
"""

#hint ## ...
x,y = 0:0.1:pi, -pi:0.1:pi #sol
sin.(x) .+ cos.(y') #sol

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Functions: exclamation mark, e.g. `push!`

In Julia many functions have a `!` appended. For instance the `push!` function which you saw above.
- signifies that the function mutates some of its arguments
- is just a convention, i.e. the `!` is not a special syntax like the `.` you saw above
- also name your mutating functions with a `!` at the end
"""


#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Functions: anonymous functions

So far our function got a name with the definition. They can also be defined without name.

See [https://docs.julialang.org/en/v1/manual/functions/#man-anonymous-functions](https://docs.julialang.org/en/v1/manual/functions/#man-anonymous-functions)
"""

map(x -> sin(x) + cos(x), 1:10)

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Key feature: multiple dispatch functions

- Julia is not an object oriented language

OO:
- methods belong to objects
- method is selected based on first argument (e.g. `self` in Python)

Multiple dispatch:
- methods are separate from objects
- are selected based on all arguments
- similar to overloading but method selection occurs at runtime and not compile-time (see also video below)
> very natural for mathematical programming

JuliaCon 2019 presentation on the subject by Stefan Karpinski
(co-creator of Julia):

["The Unreasonable Effectiveness of Multiple Dispatch"](https://www.youtube.com/watch?v=kc9HwsxE1OY)
"""

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
## Functions: Multiple dispatch demo

This cool example is based on a [blog post](https://giordano.github.io/blog/2017-11-03-rock-paper-scissors/) by Mose Giordano: 
"""

struct Rock end
struct Paper end
struct Scissors end
### of course structs could have fields as well
## struct Rock
##     color
##     name::String
##     density::Float64
## end

## define multi-method
play(::Rock, ::Paper) = "Paper wins"
play(::Rock, ::Scissors) = "Rock wins"
play(::Scissors, ::Paper) = "Scissors wins"
play(a, b) = play(b, a) # commutative

play(Scissors(), Rock())

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Multiple dispatch demo
Can easily be extended later:

- with new type:
"""
struct Pond end
play(::Rock, ::Pond) = "Pond wins"
play(::Paper, ::Pond) = "Paper wins"
play(::Scissors, ::Pond) = "Pond wins"

play(Scissors(), Pond())
#-

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
md"""
- with new function:
"""
combine(::Rock, ::Paper) = "Paperweight"
combine(::Paper, ::Scissors) = "Two pieces of papers"
## ...

combine(Rock(), Paper())

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
md"""
*Multiple dispatch makes Julia packages very composable!*

This is a key characteristic of the Julia package ecosystem.
"""

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
## Macros, i.e. those funky @-thingies

Macro calls can easily be spotted by the `@`, for example:
"""
@assert 1!=2 "Error message: why is 1==2?"

md"""
Macros add extra functionality which simple functions could not provide. They do this by
operating on the code itself as opposed to the data like functions.

- in general, as a beginner just use the provided macros as specified in their docs
- think twice before you define your own macros (using `macro`) whether you can not achieve this with a function
- more at the [Julia-docs](https://docs.julialang.org/en/v1/manual/metaprogramming/)
"""


#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
md"""
## Modules and packages

Modules can be used to structure code into larger entities, and be used to divide it into
different name spaces.  We will not make much use of those, but if interested see
[https://docs.julialang.org/en/v1/manual/modules/](https://docs.julialang.org/en/v1/manual/modules/)

**Packages** are the way people distribute code and we'll make use of them extensively.
In the first example, the Lorenz ODE, you saw
```
using Plots
```
This statement loads the package `Plots`, the older standard plotting package, and makes its functions
and types available in the current session. Note that Plots.jl comes pre-installed on Colab; the plotting
package we recommend [`Makie.jl`](https://makie.org) would need to be installed.

Use `Plots.jl` it like so:
"""

using Plots
plot( (1:10).^2 )

#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
### Packages

All public Julia packages are listed on [https://juliahub.com/ui/Packages](https://juliahub.com/ui/Packages).

You can install a package, say [`UnPack`](https://github.com/mauro3/UnPack.jl) by
```julia-repl
using Pkg
Pkg.add("UnPack")
using UnPack
```

In the REPL, there is also a package-mode (hit `]`) which is for interactive use.
"""

## Install a package the UnPack.jl package
## use it, query help on the macro `@unpack` which the package provides:

using Pkg
#hint ## ...
Pkg.add("UnPack") #sol
using UnPack #sol

#-

#hint ## ...
#?@unpack #sol

md"""
### Environments

Packages can be installed into a "environment", think virtual-env for Python. That is the recommended way to do this to
keep dependencies with their project and avoid package version conflicts. See:
- https://pkgdocs.julialang.org/v1/environments/

### Example: this course
This short course uses a few packages, you can see them in the various `Project.toml` files. The one for this notebook is
[Project.toml](https://github.com/mauro3/EGU2025-Julia-intro-and-showcase-for-geoscience/blob/main/intro-notebooks/Project.toml).
This is what gets intstalled with the invocation placed at the top of this notebook:
```julia
using Pkg; Pkg.instantiate()
```
"""


#src #########################################################################
#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
md"""
## This concludes the rapid Julia intro

There are many more features of Julia for sure but this should get you started, and setup for
the exercises.  (Let us know if you feel we left something out which would have been helpful for the exercises).

Remember you can self-help with:
- using `?` at the notebook.  Similarly there is an `apropos` function.
- the docs are your friend [https://docs.julialang.org/en/v1/](https://docs.julialang.org/en/v1/)
"""

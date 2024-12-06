
X=Polynomial([0.0,1.0])
ONE= Polynomial([1.0])
function p(n) 
    if n==0 return ONE end 
    if n==1 return X end 
    return ((2n-1)/n)*X*p(n-1)-((n-1)/n)*p(n-2)
end


"""
    Pl(x,l::Int)

computes the ``l``-th Legendre Polynomial at `x`. 
# Examples
```jldoctest
julia> dnPl(1, 2,0)
1.0
"""
Pl(x,l::Int)=dnPl(x,l,0)

"""
    dnPl(x,l::Int,k::Int)

computes the ``k``-th derivative of the ``l``-th Legendre Polynomial at `x`. 
# Examples
```jldoctest
julia> dnPl(1, 2,0)
1.0

julia> dnPl(.3,10,4)
3434.588344687501
```
"""
function dnPl(x::N,l::Int,k::Int) where N<:Number
    if l<0 error(DomainError(l,"l<0")) end
    if k>l return zero(float(x)) end 
    if l>15  return LegendrePolynomials.dnPl(x,l,k) end #fall back

    return _dnPl(float(x),l,k)
end


code="
function _dnPl(x::T,l::Int,k::Int) where T
     @match (l,k) begin
"
for l=0:15
    for k=0:l-1
        c=coeffs(derivative(p(l),k))
        sc=string.(c)
        global code*="        ($l,$k) =>  @evalpoly(x ,"
        global code*=join(sc,", ")
        global code*= ")  \n"
    end 
    c=coeffs(derivative(p(l),l))
    #change rational to (possibly) float 
    global code*="        ($l,$l) => T("* string(c[1])* ") \n"
end
code*="        end\n end"

eval(Meta.parse(code))


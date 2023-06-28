module StaticArraysStatisticsExt

using StaticArrays
using StaticArrays: _InitialValue, _reduce, _mapreduce

if isdefined(Base, :get_extension)
    import Statistics: mean
else
    import ..Statistics: mean
end

_mean_denom(a, dims::Colon) = length(a)
_mean_denom(a, dims::Int) = size(a, dims)
_mean_denom(a, ::Val{D}) where D = size(a, D)

mean(a::StaticArray; dims=:) = _reduce(+, a, dims) / _mean_denom(a, dims)
mean(f::Function, a::StaticArray; dims=:) = _mapreduce(f, +, dims, _InitialValue(), Size(a), a) / _mean_denom(a, dims)

end
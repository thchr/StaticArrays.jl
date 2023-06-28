# using Requires.jl on Julia versions <v1.9; otherwise, handled as a package extension

if !isdefined(Base, :get_extension)
    using Requires
end

@static if !isdefined(Base, :get_extension)
    function __init__()
        @require Statistics="10745b16-79ce-11e8-11f9-7d13ad32a3b2" begin
            include("../ext/StaticArraysStatisticsExt.jl")
        end
    end
end

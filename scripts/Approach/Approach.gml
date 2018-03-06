/// Approach(start, end, shift);
gml_pragma("forceinline")
if (argument0 < argument1)
    return min(argument0 + argument2, argument1); 
else
    return max(argument0 - argument2, argument1);
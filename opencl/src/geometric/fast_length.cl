
#define ATTR __attribute__((always_inline, overloadable, const))

ATTR float
fast_length(float p)
{
    return fabs(p);
}

ATTR float
fast_length(float2 p)
{
    return half_sqrt(dot(p, p));
}

ATTR float
fast_length(float3 p)
{
    return half_sqrt(dot(p, p));
}

ATTR float
fast_length(float4 p)
{
    return half_sqrt(dot(p, p));
}


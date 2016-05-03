
#include "mathD.h"

CONSTATTR INLINEATTR double
MATH_MANGLE(minmag)(double x, double y)
{
#if 0
    long ix = as_long(x);
    long iy = as_long(y);
    long ax = ix & 0x7fffffffffffffffL;
    long ay = iy & 0x7fffffffffffffffL;
    return as_double((-(ax < ay) & ix) |
	            (-(ay < ax) & iy) |
		    (-(ax == ay) & (ix | iy)));
#else
    x = BUILTIN_CANONICALIZE_F64(x);
    y = BUILTIN_CANONICALIZE_F64(y);
    double ret = BUILTIN_MIN_F64(x, y);
    double ax = BUILTIN_ABS_F64(x);
    double ay = BUILTIN_ABS_F64(y);
    ret = ax < ay ? x : ret;
    ret = ay < ax ? y : ret;
    return ret;
#endif
}


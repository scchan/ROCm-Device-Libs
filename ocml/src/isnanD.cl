
#include "mathD.h"

CONSTATTR INLINEATTR int
MATH_MANGLE(isnan)(double x)
{
    return BUILTIN_CLASS_F64(x, CLASS_SNAN|CLASS_QNAN);
}

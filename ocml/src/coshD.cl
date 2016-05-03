
#include "mathD.h"
extern PUREATTR double MATH_PRIVATE(sinhcosh)(double y, int which);

PUREATTR double
MATH_MANGLE(cosh)(double x)
{
    double y = BUILTIN_ABS_F64(x);

    double z;
    if (y < 0x1.2b708872320e2p+4) {
        z = MATH_PRIVATE(sinhcosh)(y, 1);
        z = y < 0x1.0p-28 ? 1.0 : z;
    } else {
        double t = MATH_MANGLE(exp)(y - 0x1.62e42fefa3800p-1);
        z =  MATH_MAD(t, -0x1.ef35793c76641p-45, t);
    }

    if (!FINITE_ONLY_OPT()) {
        z = y >= 0x1.633ce8fb9f87ep+9 ? as_double(PINFBITPATT_DP64) : z;
        z = BUILTIN_CLASS_F64(y, CLASS_PINF|CLASS_QNAN|CLASS_SNAN) ? y : z;
    }

    return z;
}
  

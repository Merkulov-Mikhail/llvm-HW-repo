static const float EPS = 0.000001f;
static const float PI = 3.14159265359f;
static const float PI_HALF = 1.57079632679f;
static const float PI_TWO = 6.28318530718f;


static inline int bits(const float x) {
    // no *(int*)&x for aliasing not to kick in
    int r;
    __builtin_memcpy(&r, &x, 4);
    return r;
}
static inline float from_bits(const int x) {
    // no *(float*)&x for aliasing not to kick in
    float r;
    __builtin_memcpy(&r, &x, 4);
    return r;
}

static inline int sign_bit(const float x) {
    return (bits(x) >> 31) & 1;
}

static inline int abs_bits(const float x) {
    return bits(x) & 0x7FFFFFFF;
}

static inline float abs(const float x) {
    return from_bits(abs_bits(x));
}

static inline int is_nan(const float x) {
    int exp = (bits(x) >> 23) & 0xFF;
    int man = bits(x) & 0x7FFFFF;
    return exp == 0xFF && man != 0;
}

static inline int is_zero(const float x) {
    return abs_bits(x) == 0;
}

static inline float floor_impl(const float x) {
    if (is_nan(x)) return x;
    if (abs(x) >= 8388608.0f) return x;

    if (abs(x) < 1.0f) {
        return (sign_bit(x) == 0) ? 0.0f : -1.0f;
    }

    int b = bits(x);
    int e = ((b >> 23) & 0xFF) - 127;
    int keep = 23 - e;
    int mask = (1 << keep) - 1;

    if ((b & mask) == 0) return x;

    if (sign_bit(x) == 0) {
        return from_bits(b & ~mask);
    } else {
        return from_bits(b & ~mask) - 1.0f;
    }
}

static inline float float_mod(const float x, const float y) {
    if (is_nan(x) || is_nan(y))
        return 0.0f / 0.0f;
    if (is_zero(y))
        return 0.0f / 0.0f;
    if (is_zero(x))
        return 0.0f;

    float ax = abs(x);
    float ay = abs(y);
    float q = floor_impl(ax / ay);
    float r = ax - q * ay;

    if (r < 0.0f)
        r += ay;
    if (r >= ay)
        r -= ay;

    return (sign_bit(x) == 1) ? -r : r;
}

// implement minimax?
static inline float cos_taylor(const float angle) {
    float x = float_mod(angle + PI, PI_TWO) - PI;
    x = abs(x);

    float sign = 1.0f;
    if (x > PI_HALF) {
        x = PI - x;
        sign = -1.0f;
    }

    float x2 = x * x;
    float term = 1.0f;
    float sum = 1.0f;

    for (int n = 1; n < 6; n++) {
        term *= -x2 / ((2 * n - 1) * (2 * n));
        sum += term;
    }

    return sign * sum;
}

static inline float cos(const float angle) {
    return cos_taylor(angle);
}

static inline float sin(const float angle) {
    return cos(angle - PI_HALF);
}

// quake-style rsqrt
static inline float rsqrt(const float x) {
    if (x < 0.0f)  return 0.0f / 0.0f;

    int i = bits(x);
    i = 0x5F3759DF - (i >> 1);
    float y = from_bits(i);

    y = y * (1.5f - 0.5f * x * y * y);
    y = y * (1.5f - 0.5f * x * y * y);

    return y;
}

static inline float sqrt(const float x) {
    return x * rsqrt(x);
}
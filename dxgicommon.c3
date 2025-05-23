module directx::dxgi;

struct Rational
{
    uint numerator;
    uint denominator;
}

const STANDARD_MULTISAMPLE_QUALITY_PATTERN = 0xffffffff;
const CENTER_MULTISAMPLE_QUALITY_PATTERN = 0xfffffffe;

struct SampleDesc
{
	uint count;
	uint quality;
}

typedef ColorSpaceType = int;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_FULL_G22_NONE_P709           = 0;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_FULL_G10_NONE_P709           = 1;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_STUDIO_G22_NONE_P709         = 2;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_STUDIO_G22_NONE_P2020        = 3;
const ColorSpaceType COLOR_SPACE_TYPE_RESERVED                         = 4;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_FULL_G22_NONE_P709_X601    = 5;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G22_LEFT_P601       = 6;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_FULL_G22_LEFT_P601         = 7;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G22_LEFT_P709       = 8;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_FULL_G22_LEFT_P709         = 9;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G22_LEFT_P2020      = 10;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_FULL_G22_LEFT_P2020        = 11;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_FULL_G2084_NONE_P2020        = 12;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G2084_LEFT_P2020    = 13;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_STUDIO_G2084_NONE_P2020      = 14;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G22_TOPLEFT_P2020   = 15;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G2084_TOPLEFT_P2020 = 16;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_FULL_G22_NONE_P2020          = 17;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020  = 18;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_FULL_GHLG_TOPLEFT_P2020    = 19;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_STUDIO_G24_NONE_P709         = 20;
const ColorSpaceType COLOR_SPACE_TYPE_RGB_STUDIO_G24_NONE_P2020        = 21;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G24_LEFT_P709       = 22;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G24_LEFT_P2020      = 23;
const ColorSpaceType COLOR_SPACE_TYPE_YCBCR_STUDIO_G24_TOPLEFT_P2020   = 24;
const ColorSpaceType COLOR_SPACE_TYPE_CUSTOM                           = -1;

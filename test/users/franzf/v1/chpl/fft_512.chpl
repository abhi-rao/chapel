/***************************************************************
This code was generated by  Spiral 5.0 beta, www.spiral.net --
Copyright (c) 2005, Carnegie Mellon University
All rights reserved.
The code is distributed under a BSD style license
(see http://www.opensource.org/licenses/bsd-license.php)

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright
  notice, reference to Spiral, this list of conditions and the
  following disclaimer.
  * Redistributions in binary form must reproduce the above
  copyright notice, this list of conditions and the following
  disclaimer in the documentation and/or other materials provided
  with the distribution.
  * Neither the name of Carnegie Mellon University nor the name of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*AS IS* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
******************************************************************/

use omega;
var  buf5: [0..511] complex;
var  buf6: [0..63] complex;
var  dat10: [0..123] complex;
var  dat11: [0..123] complex;
var  dat12: [0..123] complex;
var  dat13: [0..27] complex;
var  dat14: [0..27] complex;
var  dat9: [0..123] complex;

def init_fft512() {
  for i4473 in 0..30 {
    for i4509 in 0..1 {
      dat9(((i4473*4) + (i4509*2))) = omega(512, ((i4473 + 1)*(i4509*2)));
      dat9(((i4473*4) + (i4509*2) + 1)) = omega(512, ((i4473 + 1)*((i4509*2) + 4)));
    }
  }
  for i4473 in 0..30 {
    for i4487 in 0..1 {
      dat10(((i4473*4) + (i4487*2))) = omega(512, ((i4473 + 1)*(1 + (i4487*2))));
      dat10(((i4473*4) + (i4487*2) + 1)) = omega(512, ((i4473 + 1)*(5 + (i4487*2))));
    }
  }
  for i4474 in 0..30 {
    for i4517 in 0..1 {
      dat11(((i4474*4) + (i4517*2))) = omega(512, ((33 + i4474)*(i4517*2)));
      dat11(((i4474*4) + (i4517*2) + 1)) = omega(512, ((33 + i4474)*((i4517*2) + 4)));
    }
  }
  for i4474 in 0..30 {
    for i4497 in 0..1 {
      dat12(((i4474*4) + (i4497*2))) = omega(512, ((33 + i4474)*(1 + (i4497*2))));
      dat12(((i4474*4) + (i4497*2) + 1)) = omega(512, ((33 + i4474)*(5 + (i4497*2))));
    }
  }
  for i4499 in 0..6 {
    for i4525 in 0..1 {
      dat13(((i4499*4) + (i4525*2))) = omega(64, ((i4499 + 1)*i4525));
      dat13(((i4499*4) + (i4525*2) + 1)) = omega(64, ((i4499 + 1)*(i4525 + 2)));
    }
  }
  for i4500 in 0..6 {
    for i4533 in 0..1 {
      dat14(((i4500*4) + (i4533*2))) = omega(64, ((9 + i4500)*i4533));
      dat14(((i4500*4) + (i4533*2) + 1)) = omega(64, ((9 + i4500)*(i4533 + 2)));
    }
  }

}

def fft512(Y: [] complex, X: [] complex) {
  for i4475 in 0..7 {
    for i4501 in 0..3 {
      var a6919, a6920, a6921, a6922, a6924, a6925, a6926, a6927, s2866, s2867, s2868, s2869, s2870, s2871, s2872, s2873, s2874, s2875, s2876, s2877, s2878, s2879, s2880, s2881, s2882, s2883, s2884, s2885, s2886, s2887, s2888, s2889, s2890, t7360, t7361, t7362, t7363, t7364, t7365, t7366, t7367, t7368, t7369, t7370, t7371, t7372, t7373, t7374, t7375, t7376, t7377, t7378, t7379, t7380, t7381, t7382, t7383, t7384, t7385, t7386, t7387, t7388, t7389, t7390:complex;
      var a6918, a6923:int;
      a6918 = (i4475 + (8*i4501));
      s2866 = X(a6918);
      s2867 = X((a6918 + 256));
      t7360 = (s2866 + s2867);
      t7361 = (s2866 - s2867);
      s2868 = X((a6918 + 128));
      s2869 = X((a6918 + 384));
      t7362 = (s2868 + s2869);
      t7363 = (t7360 + t7362);
      t7364 = (t7360 - t7362);
      a6919 = (1.0i*(s2868 - s2869));
      t7365 = (t7361 + a6919);
      t7366 = (t7361 - a6919);
      s2870 = X((a6918 + 32));
      s2871 = X((a6918 + 288));
      t7367 = (s2870 + s2871);
      t7368 = (s2870 - s2871);
      s2872 = X((a6918 + 160));
      s2873 = X((a6918 + 416));
      t7369 = (s2872 + s2873);
      t7370 = (t7367 + t7369);
      s2874 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7367 - t7369));
      a6920 = (1.0i*(s2872 - s2873));
      s2875 = ((0.92387953251128674 + 1.0i * 0.38268343236508978)*(t7368 + a6920));
      s2876 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(t7368 - a6920));
      s2877 = X((a6918 + 64));
      s2878 = X((a6918 + 320));
      t7371 = (s2877 + s2878);
      t7372 = (s2877 - s2878);
      s2879 = X((a6918 + 192));
      s2880 = X((a6918 + 448));
      t7373 = (s2879 + s2880);
      t7374 = (t7371 + t7373);
      s2881 = (1.0i*(t7371 - t7373));
      a6921 = (1.0i*(s2879 - s2880));
      s2882 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7372 + a6921));
      s2883 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7372 - a6921));
      s2884 = X((a6918 + 96));
      s2885 = X((a6918 + 352));
      t7375 = (s2884 + s2885);
      t7376 = (s2884 - s2885);
      s2886 = X((a6918 + 224));
      s2887 = X((a6918 + 480));
      t7377 = (s2886 + s2887);
      t7378 = (t7375 + t7377);
      s2888 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7375 - t7377));
      a6922 = (1.0i*(s2886 - s2887));
      s2889 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(t7376 + a6922));
      s2890 = ((-0.92387953251128674 - 1.0i * 0.38268343236508978)*(t7376 - a6922));
      t7379 = (t7363 + t7374);
      t7380 = (t7363 - t7374);
      t7381 = (t7370 + t7378);
      a6923 = (16*i4501);
      buf6(a6923) = (t7379 + t7381);
      buf6((8 + a6923)) = (t7379 - t7381);
      a6924 = (1.0i*(t7370 - t7378));
      buf6((4 + a6923)) = (t7380 + a6924);
      buf6((12 + a6923)) = (t7380 - a6924);
      t7382 = (t7365 + s2882);
      t7383 = (t7365 - s2882);
      t7384 = (s2875 + s2889);
      buf6((1 + a6923)) = (t7382 + t7384);
      buf6((9 + a6923)) = (t7382 - t7384);
      a6925 = (1.0i*(s2875 - s2889));
      buf6((5 + a6923)) = (t7383 + a6925);
      buf6((13 + a6923)) = (t7383 - a6925);
      t7385 = (t7364 + s2881);
      t7386 = (t7364 - s2881);
      t7387 = (s2874 + s2888);
      buf6((2 + a6923)) = (t7385 + t7387);
      buf6((10 + a6923)) = (t7385 - t7387);
      a6926 = (1.0i*(s2874 - s2888));
      buf6((6 + a6923)) = (t7386 + a6926);
      buf6((14 + a6923)) = (t7386 - a6926);
      t7388 = (t7366 + s2883);
      t7389 = (t7366 - s2883);
      t7390 = (s2876 + s2890);
      buf6((3 + a6923)) = (t7388 + t7390);
      buf6((11 + a6923)) = (t7388 - t7390);
      a6927 = (1.0i*(s2876 - s2890));
      buf6((7 + a6923)) = (t7389 + a6927);
      buf6((15 + a6923)) = (t7389 - a6927);
    }
    var a6952, t7407, t7408, t7409:complex;
    var a6951:int;
    t7407 = (buf6(0) + buf6(32));
    t7408 = (buf6(0) - buf6(32));
    t7409 = (buf6(16) + buf6(48));
    a6951 = (64*i4475);
    buf5(a6951) = (t7407 + t7409);
    buf5((a6951 + 32)) = (t7407 - t7409);
    a6952 = (1.0i*(buf6(16) - buf6(48)));
    buf5((16 + a6951)) = (t7408 + a6952);
    buf5((48 + a6951)) = (t7408 - a6952);
    for i4499 in 0..6 {
      var a6998, s2907, s2908, s2909, s2910, t7426, t7427, t7428:complex;
      var a6997, b947:int;
      a6997 = (4*i4499);
      s2907 = (dat13(a6997)*buf6((1 + i4499)));
      s2908 = (dat13((1 + a6997))*buf6((33 + i4499)));
      t7426 = (s2907 + s2908);
      t7427 = (s2907 - s2908);
      s2909 = (dat13((2 + a6997))*buf6((17 + i4499)));
      s2910 = (dat13((3 + a6997))*buf6((49 + i4499)));
      t7428 = (s2909 + s2910);
      b947 = ((64*i4475) + i4499);
      buf5((b947 + 1)) = (t7426 + t7428);
      buf5((b947 + 33)) = (t7426 - t7428);
      a6998 = (1.0i*(s2909 - s2910));
      buf5((b947 + 17)) = (t7427 + a6998);
      buf5((b947 + 49)) = (t7427 - a6998);
    }
    var s2915, s2916, t7445, t7446:complex;
    var a7028:int;
    t7445 = (buf6(8) + (1.0i*buf6(40)));
    t7446 = (buf6(8) + ((- 1.0i)*buf6(40)));
    s2915 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(buf6(24) + (1.0i*buf6(56))));
    s2916 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(buf6(24) + ((- 1.0i)*buf6(56))));
    a7028 = (64*i4475);
    buf5((8 + a7028)) = (t7445 + s2915);
    buf5((40 + a7028)) = (t7445 - s2915);
    buf5((24 + a7028)) = (t7446 + s2916);
    buf5((56 + a7028)) = (t7446 - s2916);
    for i4500 in 0..6 {
      var a7074, s2933, s2934, s2935, s2936, t7463, t7464, t7465:complex;
      var a7073, b953:int;
      a7073 = (4*i4500);
      s2933 = (dat14(a7073)*buf6((9 + i4500)));
      s2934 = (dat14((1 + a7073))*buf6((41 + i4500)));
      t7463 = (s2933 + s2934);
      t7464 = (s2933 - s2934);
      s2935 = (dat14((2 + a7073))*buf6((25 + i4500)));
      s2936 = (dat14((3 + a7073))*buf6((57 + i4500)));
      t7465 = (s2935 + s2936);
      b953 = ((64*i4475) + i4500);
      buf5((b953 + 9)) = (t7463 + t7465);
      buf5((b953 + 41)) = (t7463 - t7465);
      a7074 = (1.0i*(s2935 - s2936));
      buf5((b953 + 25)) = (t7464 + a7074);
      buf5((b953 + 57)) = (t7464 - a7074);
    }
  }
  var a7095, s2945, s2946, s2947, s2948, t7514, t7515, t7516, t7517, t7518, t7519, t7520, t7521, t7522, t7523, t7524:complex;
  t7514 = (buf5(0) + buf5(256));
  t7515 = (buf5(0) - buf5(256));
  t7516 = (buf5(128) + buf5(384));
  t7517 = (t7514 + t7516);
  t7518 = (t7514 - t7516);
  a7095 = (1.0i*(buf5(128) - buf5(384)));
  t7519 = (t7515 + a7095);
  t7520 = (t7515 - a7095);
  t7521 = (buf5(64) + buf5(320));
  s2945 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(buf5(64) - buf5(320)));
  t7522 = (buf5(192) + buf5(448));
  s2946 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(buf5(192) - buf5(448)));
  t7523 = (t7521 + t7522);
  s2947 = (1.0i*(t7521 - t7522));
  t7524 = (s2945 + s2946);
  s2948 = (1.0i*(s2945 - s2946));
  Y(0) = (t7517 + t7523);
  Y(256) = (t7517 - t7523);
  Y(64) = (t7519 + t7524);
  Y(320) = (t7519 - t7524);
  Y(128) = (t7518 + s2947);
  Y(384) = (t7518 - s2947);
  Y(192) = (t7520 + s2948);
  Y(448) = (t7520 - s2948);
  for i4473 in 0..30 {
    var a7166, s2989, s2990, s2991, s2992, s2993, s2994, s2995, s2996, s2997, s2998, s2999, s3000, t7573, t7574, t7575, t7576, t7577, t7578, t7579, t7580, t7581, t7582, t7583:complex;
    var a7158, a7159, a7160, a7161, a7162, a7163, a7164, a7165, a7167, a7168, a7169, a7170:int;
    a7158 = (1 + i4473);
    a7159 = (257 + i4473);
    a7160 = (4*i4473);
    s2989 = (dat9(a7160)*buf5(a7158));
    a7161 = (1 + a7160);
    s2990 = (dat9(a7161)*buf5(a7159));
    t7573 = (s2989 + s2990);
    t7574 = (s2989 - s2990);
    a7162 = (129 + i4473);
    a7163 = (385 + i4473);
    a7164 = (2 + a7160);
    s2991 = (dat9(a7164)*buf5(a7162));
    a7165 = (3 + a7160);
    s2992 = (dat9(a7165)*buf5(a7163));
    t7575 = (s2991 + s2992);
    t7576 = (t7573 + t7575);
    t7577 = (t7573 - t7575);
    a7166 = (1.0i*(s2991 - s2992));
    t7578 = (t7574 + a7166);
    t7579 = (t7574 - a7166);
    a7167 = (65 + i4473);
    a7168 = (321 + i4473);
    s2993 = (dat10(a7160)*buf5(a7167));
    s2994 = (dat10(a7161)*buf5(a7168));
    t7580 = (s2993 + s2994);
    s2995 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(s2993 - s2994));
    a7169 = (193 + i4473);
    a7170 = (449 + i4473);
    s2996 = (dat10(a7164)*buf5(a7169));
    s2997 = (dat10(a7165)*buf5(a7170));
    t7581 = (s2996 + s2997);
    s2998 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(s2996 - s2997));
    t7582 = (t7580 + t7581);
    s2999 = (1.0i*(t7580 - t7581));
    t7583 = (s2995 + s2998);
    s3000 = (1.0i*(s2995 - s2998));
    Y(a7158) = (t7576 + t7582);
    Y(a7159) = (t7576 - t7582);
    Y(a7167) = (t7578 + t7583);
    Y(a7168) = (t7578 - t7583);
    Y(a7162) = (t7577 + s2999);
    Y(a7163) = (t7577 - s2999);
    Y(a7169) = (t7579 + s3000);
    Y(a7170) = (t7579 - s3000);
  }
  var a7211, a7212, s3013, s3014, s3015, s3016, s3017, s3018, t7632, t7633, t7634, t7635, t7636, t7637, t7638, t7639:complex;
  t7632 = (buf5(32) + (1.0i*buf5(288)));
  t7633 = (buf5(32) + ((- 1.0i)*buf5(288)));
  s3013 = ((0.92387953251128674 + 1.0i * 0.38268343236508978)*(buf5(96) + (1.0i*buf5(352))));
  s3014 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(buf5(96) + ((- 1.0i)*buf5(352))));
  s3015 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(buf5(160) + (1.0i*buf5(416))));
  s3016 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(buf5(160) + ((- 1.0i)*buf5(416))));
  s3017 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(buf5(224) + (1.0i*buf5(480))));
  s3018 = ((-0.92387953251128674 - 1.0i * 0.38268343236508978)*(buf5(224) + ((- 1.0i)*buf5(480))));
  t7634 = (t7632 + s3015);
  t7635 = (t7632 - s3015);
  t7636 = (s3013 + s3017);
  Y(32) = (t7634 + t7636);
  Y(288) = (t7634 - t7636);
  a7211 = (1.0i*(s3013 - s3017));
  Y(160) = (t7635 + a7211);
  Y(416) = (t7635 - a7211);
  t7637 = (t7633 + s3016);
  t7638 = (t7633 - s3016);
  t7639 = (s3014 + s3018);
  Y(96) = (t7637 + t7639);
  Y(352) = (t7637 - t7639);
  a7212 = (1.0i*(s3014 - s3018));
  Y(224) = (t7638 + a7212);
  Y(480) = (t7638 - a7212);
  for i4474 in 0..30 {
    var a7283, s3059, s3060, s3061, s3062, s3063, s3064, s3065, s3066, s3067, s3068, s3069, s3070, t7688, t7689, t7690, t7691, t7692, t7693, t7694, t7695, t7696, t7697, t7698:complex;
    var a7275, a7276, a7277, a7278, a7279, a7280, a7281, a7282, a7284, a7285, a7286, a7287:int;
    a7275 = (33 + i4474);
    a7276 = (289 + i4474);
    a7277 = (4*i4474);
    s3059 = (dat11(a7277)*buf5(a7275));
    a7278 = (1 + a7277);
    s3060 = (dat11(a7278)*buf5(a7276));
    t7688 = (s3059 + s3060);
    t7689 = (s3059 - s3060);
    a7279 = (161 + i4474);
    a7280 = (417 + i4474);
    a7281 = (2 + a7277);
    s3061 = (dat11(a7281)*buf5(a7279));
    a7282 = (3 + a7277);
    s3062 = (dat11(a7282)*buf5(a7280));
    t7690 = (s3061 + s3062);
    t7691 = (t7688 + t7690);
    t7692 = (t7688 - t7690);
    a7283 = (1.0i*(s3061 - s3062));
    t7693 = (t7689 + a7283);
    t7694 = (t7689 - a7283);
    a7284 = (97 + i4474);
    a7285 = (353 + i4474);
    s3063 = (dat12(a7277)*buf5(a7284));
    s3064 = (dat12(a7278)*buf5(a7285));
    t7695 = (s3063 + s3064);
    s3065 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(s3063 - s3064));
    a7286 = (225 + i4474);
    a7287 = (481 + i4474);
    s3066 = (dat12(a7281)*buf5(a7286));
    s3067 = (dat12(a7282)*buf5(a7287));
    t7696 = (s3066 + s3067);
    s3068 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(s3066 - s3067));
    t7697 = (t7695 + t7696);
    s3069 = (1.0i*(t7695 - t7696));
    t7698 = (s3065 + s3068);
    s3070 = (1.0i*(s3065 - s3068));
    Y(a7275) = (t7691 + t7697);
    Y(a7276) = (t7691 - t7697);
    Y(a7284) = (t7693 + t7698);
    Y(a7285) = (t7693 - t7698);
    Y(a7279) = (t7692 + s3069);
    Y(a7280) = (t7692 - s3069);
    Y(a7286) = (t7694 + s3070);
    Y(a7287) = (t7694 - s3070);
  }

}
